//
//  PresetData.swift
//  Fluxura
//
//  Created by Tanay Nistala on 7/11/20.
//  Copyright © 2020 Tanay Nistala. All rights reserved.
//

import SwiftUI

class Presets {
    let presets: [Preset] = [
        Preset(
            name: "Lotka-Volterra",
            subject: .biology,
            order: 1,
            types: [.nonlinear, .hetero],
            description: "The Lotka–Volterra equations, also known as the predator–prey equations, are a pair of first-order nonlinear differential equations, frequently used to describe the dynamics of biological systems in which two species interact, one as a predator and the other as prey.",
            url: "https://en.wikipedia.org/wiki/Lotka-Volterra_equations",
            model: Solver().LotkaVoltera(t:x:params:),
            parameters: ["α", "β", "γ", "δ"],
            initial: ["H", "P"],
            inputDescription: [
                ["α", "Intrinsic Rate of Prey Population Increase"],
                ["β", "Predation Rate Coefficient"],
                ["γ", "Reproduction Rate of Predators Per Prey Eaten"],
                ["δ", "Predator Mortality Rate"],
                ["H", "Prey Density"],
                ["P", "Predator Density"]
            ]
        ),
        Preset(
            name: "Rate Equation",
            subject: .chemistry,
            order: -1,
            types: [.pde],
            description: "The rate law or rate equation for a chemical reaction is a differential equation that links the reaction rate with concentrations or pressures of reactants and constant parameters (normally rate initial and partial reaction orders). To determine the rate equation for a particular system one combines the reaction rate with a mass balance for the system.",
            url: "https://en.wikipedia.org/wiki/Rate_equation",
            model: Solver().RateEquation(t:x:params:),
            parameters: ["a", "b", "c", "d", "k", "m", "n"],
            initial: ["[A]", "[B]", "[C]", "[D]"],
            inputDescription: [
                ["a, b, c, d", "Stoichiometric Coefficients"],
                ["[A], [B], [C], [D]", "Initial Concentrations"],
                ["k", "Rate Constant"],
                ["m", "Order with respect to A"],
                ["n", "Order with respect to B"]
            ]
        ),
        Preset(
            name: "Lorenz System",
            subject: .physics,
            order: -1,
            types: [.ode],
            description: "The Lorenz system is a system of ordinary differential equations first studied by Edward Lorenz. It is notable for having chaotic solutions for certain parameter values and initial conditions. In particular, the Lorenz attractor is a set of chaotic solutions of the Lorenz system.",
            url: "https://en.wikipedia.org/wiki/Lorenz_attractor",
            model: Solver().LorenzSystem(t:x:params:),
            parameters: ["σ", "ρ", "β"],
            initial: ["x", "y", "z"],
            inputDescription: [
                ["σ", "Prandtl Parameter"],
                ["ρ", "Rayleigh Parameter"],
                ["β", "Geometric Factor"],
                ["x, y, z", "Initial Coordinates"]
            ]
        ),
        Preset(
            name: "Swinging Atwood's Machine",
            subject: .physics,
            order: 2,
            types: [.ode],
            description: "The swinging Atwood's machine (SAM) is a mechanism that resembles a simple Atwood's machine except that one of the masses is allowed to swing in a two-dimensional plane, producing a dynamical system that is chaotic for some system parameters and initial conditions. Specifically, it comprises two masses connected by an inextensible, massless string suspended on two frictionless pulleys of zero radius such that the pendulum can swing freely around its pulley without colliding with the counterweight.",
            url: "https://en.wikipedia.org/wiki/Swinging_Atwood%27s_machine",
            model: Solver().SAM(t:x:params:),
            parameters: ["m"],
            initial: ["r", "r'", "θ", "θ'"],
            inputDescription: [
                ["m", "Pendulum and Counterweight Mass"],
                ["r", "Length"],
                ["r'", "Centripetal Velocity"],
                ["θ", "Release Angle"],
                ["θ'", "Angular Velocity"]
            ]
        ),
        Preset(
            name: "Double Pendulum",
            subject: .physics,
            order: 1,
            types: [.ode],
            description: "In physics and mathematics, in the area of dynamical systems, a double pendulum is a pendulum with another pendulum attached to its end, and is a simple physical system that exhibits rich dynamic behavior with a strong sensitivity to initial conditions. The motion of a double pendulum is governed by a set of coupled ordinary differential equations and is chaotic.",
            url: "https://en.wikipedia.org/wiki/Double_pendulum",
            model: Solver().DoublePendulum(t:x:params:),
            parameters: ["L1", "L2", "m1", "m2"],
            initial: ["θ", "θ'", "φ", "φ'"],
            inputDescription: [
                ["L1, L2", "Pendulum Lengths"],
                ["m1, m2", "Pendulum Masses"],
                ["θ, φ", "Angle"],
                ["θ', φ'", "Angular Velocity"]
            ]
        ),
        Preset(
            name: "3D Fluid Resistance",
            subject: .physics,
            order: 2,
            types: [.ode],
            description: "Projectile motion is a form of motion experienced by an object or particle (a projectile) that is projected near the Earth's surface and moves along a curved path under the action of gravity only. This preset takes into account air/fluid resistance in 3 dimensions for a spherical projectile.",
            url: "https://en.wikipedia.org/wiki/Projectile_motion",
            model: Solver().FluidResistance3D(t:x:params:),
            parameters: ["m", "ρ", "ETA", "c", "A"],
            initial: ["x", "x'", "y", "y'", "z", "z'"],
            inputDescription: [
                ["m", "Mass of Projectile"],
                ["ρ", "Density of Air"],
                ["ETA", "Time of Flight"],
                ["c", "Drag Coefficient (Spherical)"],
                ["A", "Cross-Sectional Area"],
                ["x, y, z", "Position"],
                ["x', y', z'", "Velocity"]
            ]
        ),
        Preset(
            name: "Simple Harmonic Motion",
            subject: .physics,
            order: 2,
            types: [.linear, .ode],
            description: "In Newtonian mechanics, for one-dimensional simple harmonic motion, the equation of motion, which is a second-order linear ordinary differential equation with constant coefficients, can be obtained by means of Newton's 2nd law and Hooke's law for a mass on a spring.",
            url: "https://en.wikipedia.org/wiki/Simple_harmonic_motion#Dynamics",
            model: Solver().SimpleHarmonic(t:x:params:),
            parameters: ["k"],
            initial: ["s", "v"],
            inputDescription: [
                ["k", "Spring Constant"],
                ["s", "Initial Position"],
                ["v", "Initial Velocity"]
            ]
        ),
        Preset(
            name: "Damped Harmonic Motion",
            subject: .physics,
            order: 2,
            types: [.ode],
            description: "In real oscillators, friction, or damping, slows the motion of the system. Due to frictional force, the velocity decreases in proportion to the acting frictional force. While in a simple undriven harmonic oscillator the only force acting on the mass is the restoring force, in a damped harmonic oscillator there is in addition a frictional force which is always in a direction to oppose the motion.",
            url: "https://en.wikipedia.org/wiki/Harmonic_oscillator#Damped_harmonic_oscillator",
            model: Solver().DampedHarmonic(t:x:params:),
            parameters: ["a", "k"],
            initial: ["s", "v"],
            inputDescription: [
                ["a", "Viscous Damping Coefficient"],
                ["k", "Spring Constant"],
                ["s", "Initial Position"],
                ["v", "Initial Velocity"]
            ]
        ),
        Preset(
            name: "Sinusoidal Driving Force",
            subject: .physics,
            order: 2,
            types: [.ode],
            description: "Driven harmonic oscillators are damped oscillators further affected by an externally applied force. This type of system appears in AC-driven RLC circuits (resistor–inductor–capacitor) and driven spring systems having internal mechanical resistance or external air resistance.",
            url: "https://en.wikipedia.org/wiki/Harmonic_oscillator#Sinusoidal_driving_force",
            model: Solver().SinusoidalDriving(t:x:params:),
            parameters: ["a", "k", "F", "ω"],
            initial: ["s", "v"],
            inputDescription: [
                ["a", "Damping Ratio"],
                ["k", "Spring Constant"],
                ["F", "Driving Amplitude"],
                ["ω", "Driving Frequency"],
                ["s", "Initial Position"],
                ["v", "Initial Velocity"]
            ]
        )
//        Preset(
//            name: "Poisson",
//            subject: .physics,
//            order: -1,
//            types: [.pde],
//            description: "Poisson's equation is an elliptic partial differential equation of broad utility theoretical physics. For example, the solution to Poisson's equation the potential field caused by a given electric charge or mass density distribution; with the potential field known, one can then calculate electrostatic or gravitational (force) field. It is a generalization of Laplace's equation, which is also frequently seen in physics.",
//            url: "https://en.wikipedia.org/wiki/Poisson%27s_equation",
//            model: Solver().LotkaVoltera(t:x:params:),
//            parameters: ["Parameter 1", "Parameter 2"],
//            initial: ["Input 1", "Input 2"]
//        ),
//        Preset(
//            name: "Poisson-Boltzmann",
//            subject: .physics,
//            order: 2,
//            types: [.pde],
//            description: "The Poisson–Boltzmann equation is a useful equation in many settings, whether it be to understand physiological interfaces, polymer science, electron interactions in a semiconductor, or more. It aims to describe the distribution of the electric potential in solution in the direction normal to a charged surface. This distribution is important to determine how the electrostatic interactions will affect the molecules in solution. The Poisson–Boltzmann equation is derived via mean-field assumptions.",
//            url: "https://en.wikipedia.org/wiki/Poisson-Boltzmann_equation",
//            model: Solver().LotkaVoltera(t:x:params:),
//            parameters: ["Parameter 1", "Parameter 2"],
//            initial: ["Input 1", "Input 2"]
//        ),
//        Preset(
//            name: "Navier-Stokes",
//            subject: .physics,
//            order: -1,
//            types: [.nonlinear, .pde, .hetero],
//            description: "The Navier–Stokes equations are a set of partial differential equations which describe the motion of viscous fluid substances. These balance equations arise from applying Isaac Newton's second law to fluid motion, together with the assumption that the stress in the fluid is the sum of a diffusing viscous term (proportional to the gradient of velocity) and a pressure term—hence describing viscous flow.",
//            url: "https://en.wikipedia.org/wiki/Navier-Stokes_equations",
//            model: Solver().LotkaVoltera(t:x:params:),
//            parameters: ["Parameter 1", "Parameter 2"],
//            initial: ["Input 1", "Input 2"]
//        ),
//        Preset(
//            name: "Euler-Lagrange",
//            subject: .physics,
//            order: 2,
//            types: [.pde],
//            description: "In the calculus of variations, the Euler equation is a second-order partial differential equation whose solutions are the functions for which a given functional is stationary. Because a differentiable functional is stationary at its local extrema, the Euler–Lagrange equation is useful for solving optimization problems in which, given some functional, one seeks the function minimizing or maximizing it. This is analogous to Fermat's theorem in calculus, stating that at any point where a differentiable function attains a local extremum its derivative is zero.",
//            url: "https://en.wikipedia.org/wiki/Euler-Lagrange_equation",
//            model: Solver().LotkaVoltera(t:x:params:),
//            parameters: ["Parameter 1", "Parameter 2"],
//            initial: ["Input 1", "Input 2"]
//        ),
//        Preset(
//            name: "Eikonal",
//            subject: .physics,
//            order: -1,
//            types: [.nonlinear, .pde],
//            description: "The eikonal equation is a non-linear partial differential equation encountered in problems of wave propagation, when the wave equation is approximated using the WKB theory. It is derivable from Maxwell's equations of electromagnetics, and provides a link between physical (wave) optics and geometric (ray) optics.",
//            url: "https://en.wikipedia.org/wiki/Eikonal_equation",
//            model: Solver().LotkaVoltera(t:x:params:),
//            parameters: ["Parameter 1", "Parameter 2"],
//            initial: ["Input 1", "Input 2"]
//        ),
//        Preset(
//            name: "Korteweg-de Vries",
//            subject: .physics,
//            order: -1,
//            types: [.nonlinear, .pde],
//            description: "In mathematics, the Korteweg–de Vries (KdV) equation is a mathematical model of waves on shallow water surfaces. It is particularly notable as the prototypical example of an exactly solvable model, that is, a non-linear partial differential equation whose solutions can be exactly and precisely specified. KdV can be solved by means of the inverse scattering transform.",
//            url: "https://en.wikipedia.org/wiki/Korteweg-de_Vries_equation",
//            model: Solver().LotkaVoltera(t:x:params:),
//            parameters: ["Parameter 1", "Parameter 2"],
//            initial: ["Input 1", "Input 2"]
//        ),
//        Preset(
//            name: "Laplace",
//            subject: .physics,
//            order: 2,
//            types: [.pde],
//            description: "In mathematics and physics, Laplace's equation is a second-order partial differential equation named after Pierre-Simon Laplace who first studied its properties.",
//            url: "https://en.wikipedia.org/wiki/Laplace%27s_equation",
//            model: Solver().LotkaVoltera(t:x:params:),
//            parameters: ["Parameter 1", "Parameter 2"],
//            initial: ["Input 1", "Input 2"]
//        ),
//        Preset(
//            name: "Heat Equation",
//            subject: .physics,
//            order: 1,
//            types: [.linear, .pde, .homo],
//            description: "In physics and mathematics, the heat equation is a partial differential equation that describes how the distribution of some quantity (such as heat) evolves over time in a solid medium, as it spontaneously flows from places where it is higher towards places where it is lower. It is a special case of the diffusion equation.",
//            url: "https://en.wikipedia.org/wiki/Heat_Equation",
//            model: Solver().LotkaVoltera(t:x:params:),
//            parameters: ["Parameter 1", "Parameter 2"],
//            initial: ["Input 1", "Input 2"]
//        ),
//        Preset(
//            name: "Wave Equation",
//            subject: .physics,
//            order: 2,
//            types: [.linear, .pde],
//            description: "The wave equation is an important second-order linear partial differential equation for the description of waves—as they occur in classical physics—such as mechanical waves (e.g. water waves, sound waves and seismic waves) or light waves. It arises in fields like acoustics, electromagnetics, and fluid dynamics.",
//            url: "https://en.wikipedia.org/wiki/Wave_equation",
//            model: Solver().LotkaVoltera(t:x:params:),
//            parameters: ["Parameter 1", "Parameter 2"],
//            initial: ["Input 1", "Input 2"],
//            inputDescription: [[String]]()
//        ),
    ]
}
