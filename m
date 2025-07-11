Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B5A9C83F1A
	for <linux-i3c@archiver.kernel.org>; Fri, 11 Jul 2025 09:00:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HnJ/s3z055eJmOtoCdclSx1OY67oTcP7GmVDfEFFpzo=; b=mSlvjoOfJp2XMZ
	zPgeKDhOiw0AHriOVm3QEfwasjUel2WTM9mfE7waNSR9799ojCkepokCCwK7Nepj/wx0d+4eHiL6E
	IGClqSf+GAX6V35IHvCRq3dtGQjLoIr6V8kxt9HESHzaJ0jjKnRWP6iXFKpjNiMRa1Ce0FuzI2e6N
	7QrZMpT7WRa5G4doMfgUWjaBV26I7hq7U1hqFnApDyjRkfM+CnUkY4RDA39ohj8wLuqNY9lqVOhZz
	4lYYkQVFalTqel4g52ofRzjZspT6RQNo1SSKhNmSpnagFLjau4/OR2ezI+PlKKE4a9RFnaVv6FEkD
	DZY3FlKi2CGeIbzU5zxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ua9c5-0000000EEza-0klR;
	Fri, 11 Jul 2025 09:00:13 +0000
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ua8uC-0000000E69N-2KQs
	for linux-i3c@lists.infradead.org;
	Fri, 11 Jul 2025 08:14:53 +0000
Received: by mail-ed1-x536.google.com with SMTP id 4fb4d7f45d1cf-60dffae17f3so2681206a12.1
        for <linux-i3c@lists.infradead.org>; Fri, 11 Jul 2025 01:14:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752221690; x=1752826490; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=3aTSZfQu30nYtUNf/QLsa8512IXt+B0u0txxktETggs=;
        b=N+Tb4jmp1blvxxvg5f1aI8NDL401gSD6z6aOY4yA9ogwM/ToBX2tRN8s3l6+3GSypR
         JQXdornRDlJau8xsqPzGPomaAWgZ7krAxj6v2PmgQDo9Mipu50XYqDcd8www1LroR/qs
         Ir/jC9+7PSCtIdghNX0xOLQgirHzfTcCaBJmdKmITHfu1STVA5sfWtHlAA+URv9VaT8r
         Y9FyhTbiveIGGd3blKbNVjnhgaBySNtixKq45b6AZEkIOtlU1EygwGnNVZ//4BD07gkz
         AHfZc+XJVMkE6EIMQsWtIabHvvxRVlYt7bAJZ90uywJLy+OMYfWwSuYxTW9je6H++RzR
         C8YQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752221690; x=1752826490;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3aTSZfQu30nYtUNf/QLsa8512IXt+B0u0txxktETggs=;
        b=BTuIkGUG99GpU87NcYprHCURN5Kt/Bc3DYx3mWB3TjoW3zRmC25nJzayqYE/jSjnsz
         lKpiYkDOtoR0g7lBoJ2XOt9mfMISvAL4mJd3QTUABgBqraAbC1D5TzSskWTk4V+i0OT9
         MPiuIkDQiJvGiQTUQWljR2SAHcl/qq08IzpFv9ux444p6STRs5EpIwgy6z5+VqgWykdt
         04sOJVgYNVdFBlP8zxxz+ait+BAFeSAusgYLkwUP0SWQEUQRWg0ZW9x9Eprwikz9jAbG
         I4K5r29rl9q7bXRrjLH1krlPcwVvc7V1OVBV/6KXvD5srq2LJleiXc5xOGYuaHQSt42u
         oqOA==
X-Forwarded-Encrypted: i=1; AJvYcCVveQsZ9/nrJNkwiPiKUI0QoLtRmgcy2G6i2LVRRNEinCxv6pOZgDU6mrodbOaI1er7MB9IJ4ctv3Q=@lists.infradead.org
X-Gm-Message-State: AOJu0YynkZHFUQpu0cSoaI2RisrSkE81RFpHdlLnJId90zsl4H0x2Rz0
	UzsMPqpdZhzddNb/dCQLcTwNxe10lYl9XVqv2PfK+BtHi/glITlsd0nU
X-Gm-Gg: ASbGnct5wJ3nI59YOsvZrVL6UorURO9OURv2zdJEmREeeDQr+AOna4sUjI66Vcv8QKV
	RfShnINdmfme9bD/9qlhQnBCNl7sVBG9ePUkbquEOxWdvqV/4sRdroZjFPAo7uxIUVSAlyaI2xy
	PlDsUDnH60yKrD+2Z8eTOxBweATk/GP0VI1QY/3S2yHkr2zcfjc+LfCzcFN9+fn/IL4zSJc+CQr
	iR8Bsy4L6yJOYKp6CHlpR1xcXbfur54rmSXk1kE9dLEVc9d2vnNoZwqvRbEsY+tFSmUueu82/MO
	6curD0y9ZigPpvMEDziTViQkwWYkVuJ47y8gXpw2na9u4pl2RjMi/dllh5x0hcj7UOKIsxQMCea
	klZB/PJmDvISS8k5ln0Gw2dvqTFTMfqcBYylMrdwvOls=
X-Google-Smtp-Source: AGHT+IE7tGsdW3nPobnCtRjN6yH4ugFfWzOhdS2yH9B0+mLBkpnzOK2yGgLvm6mdMcFYbZvxYHDxPQ==
X-Received: by 2002:aa7:c3d1:0:b0:604:e33f:e5c0 with SMTP id 4fb4d7f45d1cf-611e84e6128mr1445622a12.30.1752221689856;
        Fri, 11 Jul 2025 01:14:49 -0700 (PDT)
Received: from HYB-DlYm71t3hSl.ad.analog.com ([137.71.226.91])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-611c9528b05sm1875104a12.30.2025.07.11.01.14.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Jul 2025 01:14:49 -0700 (PDT)
Date: Fri, 11 Jul 2025 10:14:45 +0200
From: Jorge Marques <gastmaier@gmail.com>
To: Conor Dooley <conor@kernel.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, 
	Devid Lechner <dlechner@baylibre.com>, Adrian Costina <adrian.costina@analog.com>, 
	Jorge Marques <jorge.marques@analog.com>, Alexandre Belloni <alexandre.belloni@bootlin.com>, 
	Frank Li <Frank.Li@nxp.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-i3c@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 1/2] dt-bindings: i3c: Add adi-i3c-master
Message-ID: <pbaxwzj3gmjwkqbh32wfcac4zqjyg4sfkgit3hs6v372cxf3wa@kp5qg6m2tqlm>
References: <20250626-adi-i3c-master-v4-0-3846a1f66d5e@analog.com>
 <20250626-adi-i3c-master-v4-1-3846a1f66d5e@analog.com>
 <20250627-steadfast-ferret-of-expertise-5c8ff2@krzk-bin>
 <tl5fckhrivaqfyzwyb2o2a7gykpigwend7z2nduqgbbej3hqbs@vxxtsadhtdmt>
 <41782ded-908b-46ef-8f75-4d2565476b7c@kernel.org>
 <cfi6rzhco2ba6pcbk57l7tblimuks5jnpgaly7nbedbrpyhtma@u46if22kurwk>
 <v2ybju75bpjdqxfkell47nlkeyal36ylmnqt2yvpncxnmp2irb@pygx56jsyxkr>
 <20250702-armchair-favorite-c734b53444e2@spud>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250702-armchair-favorite-c734b53444e2@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250711_011452_599637_C60AC5DD 
X-CRM114-Status: GOOD (  46.53  )
X-BeenThere: linux-i3c@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-i3c.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-i3c>,
 <mailto:linux-i3c-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-i3c/>
List-Post: <mailto:linux-i3c@lists.infradead.org>
List-Help: <mailto:linux-i3c-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-i3c>,
 <mailto:linux-i3c-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org

On Wed, Jul 02, 2025 at 12:38:41PM +0100, Conor Dooley wrote:
> On Wed, Jul 02, 2025 at 12:58:00PM +0200, Jorge Marques wrote:
> > On Fri, Jun 27, 2025 at 06:02:26PM +0200, Jorge Marques wrote:
> > > On Fri, Jun 27, 2025 at 04:49:19PM +0200, Krzysztof Kozlowski wrote:
> > > > On 27/06/2025 16:38, Jorge Marques wrote:
> > > > > On Fri, Jun 27, 2025 at 08:56:55AM +0200, Krzysztof Kozlowski wrote:
> > > > >> On Thu, Jun 26, 2025 at 12:07:36PM +0200, Jorge Marques wrote:
> > > > >>> Add bindings doc for ADI I3C Controller IP core, a FPGA synthesizable IP
> > > > >>> core that implements the MIPI I3C Basic controller specification.
> > > > >>
> > > > >> How did you resolve my last comment? I don't see any explanation -
> > > > >> neither here nor in the binding description. Binding description is
> > > > >> actually better place, I think now.
> > > > >>
> > > > >> Best regards,
> > > > >> Krzysztof
> > > > >>
> > > > > 
> > > > > Hi Krzysztof,
> > > > > 
> > > > > I forgot to condense out discussion on v4.
> > > > > What about this binding description:
> > > > > 
> > > > >   description: |
> > > > >     FPGA-based I3C controller designed to interface with I3C and I2C
> > > > >     peripherals, implementing a subset of the I3C-basic specification.
> > > > >     The IP core is tested on arm, microblaze, and arm64 architectures.
> > > > >     It takes one or two clocks, axi and i3c. If only axi is provided,
> > > > >     then there is no clock signal to the i3c input clock pin and axi
> > > > 
> > > > This is obvious from the schema, drop.
> > > Ack.
> > > 
> > > > 
> > > > >     clock drives the whole IP. The compatible is suffixed by 1.00.a
> > > > >     foreseeing future controllers by Analog Devices Inc. and breaking
> > > > >     changes.
> > > > 
> > > > I don't understand that. How are you breaking any changes? And how
> > > > 1.00.a predicts future? I don't think this reflects previous discussion.
> > > > Why you were asked to go with v1.00.a?
> > > The -1.00.a suffix came from this discussion:
> > >   
> > >   https://lore.kernel.org/linux-i3c/ildi2pup2zkyv4stuknkrjysex3yzsbrrsrwbgcc4xgvdhwrdd@7qh4y6mutgy2/
> > > 
> > > Other adi bindings use this suffix. I personally wouldn't add any suffix
> > > unless told otherwise, as I expressed on the thread. Should I drop it?
> > > or suffix it with something else?
> 
> > 
> > I went after the reason of the historically -1.00.a suffix and
> > discovered that they came into existence due to AMD Xilinx auto
> > generation devicetree tool SDTGen
> > https://github.com/Xilinx/system-device-tree-xlnx
> > that would automatically suffix with the IP version, defaulting to 1.00.a,
> > and for a seamless experience, the were copied over to the dt-bindings.
> > 
> > The adi,axi-pwmgen dt-binding went more creative and suffixed with
> > -2.00.a, while never enforcing Vivado to yield the devicetree with such
> > value (Major version is asserted in the driver through reg access, the
> > current core version is v2.1.1)
> > 
> > Testing on my side (AMD Xilinx Vivado 2024.2), it seems Vivado now
> > defaults to 1.0, so the previous bindings from the other IPs are not
> > accurate anymore, either, (axi-pwmgen auto gens
> > `compatible = "xlnx,axi-pwm-gen-1.0";` (`xlnx` instead of `adi`, also)).
> > 
> > For fun, the current Vivado version thinks the devicetree node for the
> > i3c master should be as follows:
> > 
> >   i3c_host_interface: i3c_controller_host_interface@44a00000 {
> >           compatible = "xlnx,i3c-controller-host-interface-1.0";
> >           reg = <0x44a00000 0x10000>;
> >           clocks = <&clkc 15>;
> >           clock-names = "s_axi_aclk";
> >   };
> > 
> > Let me know if we can drop the suffix, or replace with something else.
> > The current register defined core version is v0.1.0.
> 
> Please, as I requested in the original thread, add versioning
> information. I'm clearly not asking you to make up some garbage version
> number, or to add "1.00a" if that's not an accurate version (and never
> did AFAICT). If 0.1.0 is the version of the IP core, I'd like you to use
> that.
> 
> If other ADI IP cores are using crap version numbers that came from
> some Xilinx tooling that don't represent the actual versions of the IPs,
> that's probably something you should mention to your colleagues that
> maintain those bindings.


Hi Conor,

My proposal (1) for the Analog Devices Inc. open source IP Cores is to
migrate to semantic versioning.
(1) https://github.com/analogdevicesinc/hdl/pull/1831

The dt-binding must end with the major value, with the first supported
version starting at 1. Therefore, the binding will be:

* adi,i3c-master-1

At driver level, the debug version value is `v%u.%u.%u`, and the driver
shall check the minor version value for handling feature changes. While
the major bump is restricted for breaking changes, which, in some cases,
also generates a new dt-binding.

For backwards compatibility, existing ADI IP Cores that prints `v%u.%u.%c`
should print `v%u.%u.%u` instead, but keep their current value (e.g.,
`a`->`97`), until the minor is bumped, when the patch version resets to 0.

Rework across register accessed IPs is being handled here:
https://github.com/analogdevicesinc/hdl/pull/1829
There are more than 50 IPs with register access, so I need to be cautious.

What is your take on this? Does it resolve the bindings concern?

Adding David to the thread, since the axi-spi-engine already moved to
`v%u.%u.%u` format.

Best regards,
Jorge


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
