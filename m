Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40BF5C83F1A
	for <linux-i3c@archiver.kernel.org>; Mon, 14 Jul 2025 12:21:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=x38H62CLVorhztMrcNDyVzBlAXRmF3eeBoKntOdQCvc=; b=oZawBAslQToifO
	h0BSCfhgTovkv6irl2JVzfgUSJNivNvbe5/xxveQvvpIWDzM24BqBJ8D0Mf3RMKgM6zUvvPm1qLUN
	ikVAEne0oQRibWPUNQvAdEyHtwxit/+3A4HNb8uuDpul971diJWaJy56lKHsrLhPDLiyQG11k051e
	YWXx5bH1M/uBNKAQ4HZkNKR8rG47H+CL3+cy1EDc2/pKFY2dhxDWqAZli8QaUtg9EDbLEukLCr2Fi
	RG8HHeSKjahgS8MEEUeNBdg/i/SWQtgFl9x7fU0AZF+vG/Hj3bBprCiCydfUYPl1p7KTT0kGHZAPk
	9Q6/ZANhu4DGUdzdy8Ag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubIBe-000000029E7-04HW;
	Mon, 14 Jul 2025 12:21:38 +0000
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubFs2-00000001qCd-01oF
	for linux-i3c@lists.infradead.org;
	Mon, 14 Jul 2025 09:53:15 +0000
Received: by mail-ed1-x52e.google.com with SMTP id 4fb4d7f45d1cf-60768f080d8so7819711a12.1
        for <linux-i3c@lists.infradead.org>; Mon, 14 Jul 2025 02:53:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752486792; x=1753091592; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=RNGssqJWYojAWdADXLp90CGwUVtfIpXi8sIRAMW1UaI=;
        b=Jpwvmb3RCaafg2R1O8iFEBs7p6WWIPeh8abrIOlkveYj7ASZKTC/Xhz8s5+9gMDOUN
         M7IJNMZsbzPa8KNdLaXasTxgwYopjw+AqQxY6OkNWtMWVr/XUPt2UyIoibRTVVqxXZmA
         TliPBA5be/X+Fmx4Zj/k4Q3eSopYgcADt8Mvgbk6SbGK2GvKZ0LilX3DOZMXt497boOg
         VZrW8/6i9eBHC1G3WdpVQGk1Ggo4gJQk5/UB0LRk/Lfvr1IT8HSpsuQB4DGKLGClTrWe
         WbWfgwgM98DYilMJL5U8OSyzw7GaLsbbM5AQeoX43JITAc4/E2YKvPnb9ogCtjx1FXmm
         uBiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752486792; x=1753091592;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RNGssqJWYojAWdADXLp90CGwUVtfIpXi8sIRAMW1UaI=;
        b=JyFEP/wYtaeojbo+SZyKKblMu+PeG6rodLKcuJLXCrZL44HNx7JTnhqFTiD9kmBllY
         1WZrMFnwY3XkVe6DRV3FSf8QDAFBWcY5/T2Oea1jqnCel00JmtldlmjV3pBQ3hfquyw6
         Qxup4IxbFHNRJuHNjIlajpVoG4UvRIvZtn/G21NE2W6zkLHBRQVYkIJj+RoMT0qDR8iH
         h+VzYgVAPtYJEuXGc/BZBuk8OBudSER9zxv4e8zDdtkuuMSufDdBZZYPWFjSsw8brCeU
         BkzkbQHly/SS7HbAJ+R8IuelG+EhgiI1HFPGmdBx+byPCKmo1nbyYsSyGcwWnzaWuEle
         eH5w==
X-Forwarded-Encrypted: i=1; AJvYcCWmtsX0gkiec+u6LXXcCkzoQL58mkHWWgQHPs5FzCkTz3oy5evvUMvYXogA/moL5najAQgHXM3kcik=@lists.infradead.org
X-Gm-Message-State: AOJu0Yy70fdCOohJKFYpZcLmqvNr1pAHZUmpG/23GiXim23ncDwI3iIK
	ccGmBP7+8seNpPzFmkXLUuXrzNWGsRkbNoph//bBmUJNPmADFif7NotV
X-Gm-Gg: ASbGncuPWK1YnRuKj2sGnt3p2wbihB4XNL/+1B1kZAdaw7VrRXFqZzFUq+3ueW/4Khr
	xcfS//7efKBo5cLkc2mUOzzcAuVR2oTCenqFk7RerslmjnmNx1jtaZrx+42iNcLBIXZwdOAZJ8N
	/AvvLvGev51A9BHLtmrHZBqiN91SxkryKYVBwv81358DCw4W5dFbQUGYHk5YJKCz3t08w9xIcR8
	IVwzanRAhtgsS2o+NaTdsPt/FWY0AE3APxfCrHfXhHNjgNcNHMsXl+SIVVCdZX8ek8SdwK3ckk4
	ry8rBLiQqK7BF4JzxPmHpOyFLDncoSmhDiQpHZAQIrjOtfCbxn6QenIGpHPRroW7lcrSP2n3i9t
	jwaRPtSChaNEnMcEPZyAxtwzljlzaRhveZKVsyQR4Dg==
X-Google-Smtp-Source: AGHT+IFEDpClpXlaWllZOCERoY3lhQ4yIfuXZ4g3QSxGrrVJ8qXDMwIx0cCzdpXoL8/NvPGkH2XWPg==
X-Received: by 2002:a05:6402:210f:b0:607:f431:33fb with SMTP id 4fb4d7f45d1cf-611e761054cmr10942567a12.3.1752486791373;
        Mon, 14 Jul 2025 02:53:11 -0700 (PDT)
Received: from HYB-DlYm71t3hSl.ad.analog.com ([137.71.226.91])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-611c95232d8sm5823042a12.18.2025.07.14.02.53.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Jul 2025 02:53:10 -0700 (PDT)
Date: Mon, 14 Jul 2025 11:53:07 +0200
From: Jorge Marques <gastmaier@gmail.com>
To: Conor Dooley <conor@kernel.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, 
	Devid Lechner <dlechner@baylibre.com>, Adrian Costina <adrian.costina@analog.com>, 
	Jorge Marques <jorge.marques@analog.com>, Alexandre Belloni <alexandre.belloni@bootlin.com>, 
	Frank Li <Frank.Li@nxp.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-i3c@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 1/2] dt-bindings: i3c: Add adi-i3c-master
Message-ID: <tttx7nc4ribxmt73gu6n4r5rr2velypsublc2dlhdn6ltarthb@mllvjkkr5zn5>
References: <20250626-adi-i3c-master-v4-0-3846a1f66d5e@analog.com>
 <20250626-adi-i3c-master-v4-1-3846a1f66d5e@analog.com>
 <20250627-steadfast-ferret-of-expertise-5c8ff2@krzk-bin>
 <tl5fckhrivaqfyzwyb2o2a7gykpigwend7z2nduqgbbej3hqbs@vxxtsadhtdmt>
 <41782ded-908b-46ef-8f75-4d2565476b7c@kernel.org>
 <cfi6rzhco2ba6pcbk57l7tblimuks5jnpgaly7nbedbrpyhtma@u46if22kurwk>
 <v2ybju75bpjdqxfkell47nlkeyal36ylmnqt2yvpncxnmp2irb@pygx56jsyxkr>
 <20250702-armchair-favorite-c734b53444e2@spud>
 <pbaxwzj3gmjwkqbh32wfcac4zqjyg4sfkgit3hs6v372cxf3wa@kp5qg6m2tqlm>
 <20250711-eradicate-vendetta-ea6d44737e0c@spud>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250711-eradicate-vendetta-ea6d44737e0c@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250714_025314_047419_3ECA040B 
X-CRM114-Status: GOOD (  64.12  )
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

On Fri, Jul 11, 2025 at 05:28:57PM +0100, Conor Dooley wrote:
> On Fri, Jul 11, 2025 at 10:14:45AM +0200, Jorge Marques wrote:
> > On Wed, Jul 02, 2025 at 12:38:41PM +0100, Conor Dooley wrote:
> > > On Wed, Jul 02, 2025 at 12:58:00PM +0200, Jorge Marques wrote:
> > > > On Fri, Jun 27, 2025 at 06:02:26PM +0200, Jorge Marques wrote:
> > > > > On Fri, Jun 27, 2025 at 04:49:19PM +0200, Krzysztof Kozlowski wrote:
> > > > > > On 27/06/2025 16:38, Jorge Marques wrote:
> > > > > > > On Fri, Jun 27, 2025 at 08:56:55AM +0200, Krzysztof Kozlowski wrote:
> > > > > > >> On Thu, Jun 26, 2025 at 12:07:36PM +0200, Jorge Marques wrote:
> > > > > > >>> Add bindings doc for ADI I3C Controller IP core, a FPGA synthesizable IP
> > > > > > >>> core that implements the MIPI I3C Basic controller specification.
> > > > > > >>
> > > > > > >> How did you resolve my last comment? I don't see any explanation -
> > > > > > >> neither here nor in the binding description. Binding description is
> > > > > > >> actually better place, I think now.
> > > > > > >>
> > > > > > >> Best regards,
> > > > > > >> Krzysztof
> > > > > > >>
> > > > > > > 
> > > > > > > Hi Krzysztof,
> > > > > > > 
> > > > > > > I forgot to condense out discussion on v4.
> > > > > > > What about this binding description:
> > > > > > > 
> > > > > > >   description: |
> > > > > > >     FPGA-based I3C controller designed to interface with I3C and I2C
> > > > > > >     peripherals, implementing a subset of the I3C-basic specification.
> > > > > > >     The IP core is tested on arm, microblaze, and arm64 architectures.
> > > > > > >     It takes one or two clocks, axi and i3c. If only axi is provided,
> > > > > > >     then there is no clock signal to the i3c input clock pin and axi
> > > > > > 
> > > > > > This is obvious from the schema, drop.
> > > > > Ack.
> > > > > 
> > > > > > 
> > > > > > >     clock drives the whole IP. The compatible is suffixed by 1.00.a
> > > > > > >     foreseeing future controllers by Analog Devices Inc. and breaking
> > > > > > >     changes.
> > > > > > 
> > > > > > I don't understand that. How are you breaking any changes? And how
> > > > > > 1.00.a predicts future? I don't think this reflects previous discussion.
> > > > > > Why you were asked to go with v1.00.a?
> > > > > The -1.00.a suffix came from this discussion:
> > > > >   
> > > > >   https://lore.kernel.org/linux-i3c/ildi2pup2zkyv4stuknkrjysex3yzsbrrsrwbgcc4xgvdhwrdd@7qh4y6mutgy2/
> > > > > 
> > > > > Other adi bindings use this suffix. I personally wouldn't add any suffix
> > > > > unless told otherwise, as I expressed on the thread. Should I drop it?
> > > > > or suffix it with something else?
> > > 
> > > > 
> > > > I went after the reason of the historically -1.00.a suffix and
> > > > discovered that they came into existence due to AMD Xilinx auto
> > > > generation devicetree tool SDTGen
> > > > https://github.com/Xilinx/system-device-tree-xlnx
> > > > that would automatically suffix with the IP version, defaulting to 1.00.a,
> > > > and for a seamless experience, the were copied over to the dt-bindings.
> > > > 
> > > > The adi,axi-pwmgen dt-binding went more creative and suffixed with
> > > > -2.00.a, while never enforcing Vivado to yield the devicetree with such
> > > > value (Major version is asserted in the driver through reg access, the
> > > > current core version is v2.1.1)
> > > > 
> > > > Testing on my side (AMD Xilinx Vivado 2024.2), it seems Vivado now
> > > > defaults to 1.0, so the previous bindings from the other IPs are not
> > > > accurate anymore, either, (axi-pwmgen auto gens
> > > > `compatible = "xlnx,axi-pwm-gen-1.0";` (`xlnx` instead of `adi`, also)).
> > > > 
> > > > For fun, the current Vivado version thinks the devicetree node for the
> > > > i3c master should be as follows:
> > > > 
> > > >   i3c_host_interface: i3c_controller_host_interface@44a00000 {
> > > >           compatible = "xlnx,i3c-controller-host-interface-1.0";
> > > >           reg = <0x44a00000 0x10000>;
> > > >           clocks = <&clkc 15>;
> > > >           clock-names = "s_axi_aclk";
> > > >   };
> > > > 
> > > > Let me know if we can drop the suffix, or replace with something else.
> > > > The current register defined core version is v0.1.0.
> > > 
> > > Please, as I requested in the original thread, add versioning
> > > information. I'm clearly not asking you to make up some garbage version
> > > number, or to add "1.00a" if that's not an accurate version (and never
> > > did AFAICT). If 0.1.0 is the version of the IP core, I'd like you to use
> > > that.
> > > 
> > > If other ADI IP cores are using crap version numbers that came from
> > > some Xilinx tooling that don't represent the actual versions of the IPs,
> > > that's probably something you should mention to your colleagues that
> > > maintain those bindings.
> > 
> > 
> > My proposal (1) for the Analog Devices Inc. open source IP Cores is to
> > migrate to semantic versioning.
> > (1) https://github.com/analogdevicesinc/hdl/pull/1831
> > 
> > The dt-binding must end with the major value, with the first supported
> > version starting at 1. Therefore, the binding will be:
> > 
> > * adi,i3c-master-1
> > 
> > At driver level, the debug version value is `v%u.%u.%u`, and the driver
> > shall check the minor version value for handling feature changes. While
> > the major bump is restricted for breaking changes, which, in some cases,
> > also generates a new dt-binding.
> > 
> > For backwards compatibility, existing ADI IP Cores that prints `v%u.%u.%c`
> > should print `v%u.%u.%u` instead, but keep their current value (e.g.,
> > `a`->`97`), until the minor is bumped, when the patch version resets to 0.
> > 
> > Rework across register accessed IPs is being handled here:
> > https://github.com/analogdevicesinc/hdl/pull/1829
> > There are more than 50 IPs with register access, so I need to be cautious.
> > 
> > What is your take on this? Does it resolve the bindings concern?
> 
> I think it is a good idea to establish version numbers that actually
> have a meaning, rather than using something garbage. I think you should
> probably put the "v" into the number in the compatible - 1.00 or 1.00.a
> is fairly clearly a version number but "-1" is less clear.
>
Hi Conor,

The format that is currently winning my internal discussion is
`adi,<ip-name>-v<major>`.
And the next patch will be submitted as `adi,i3c-master-v1`.

> Also "the binding must end with the major value" is a bit of an odd
> requirement I think. The sort of situations that may cause different
> compatibles to be introduced are not likely to be restricted to majors.

sifive-blocks-ip-versioning.txt uses
"sifive,<ip-name><integer-version-number>", While the xilinx.txt uses
the last version that uses the same interface. Both implicitly hide away
features (minor) and fixes (patches). What I am enforcing is that, if
the interface changes, the major field must be bumped. In most cases,
everything else is minor matching at the driver level, and if exceptions
occur, add to the commit message the justification and that's it.

> That may be something like properties only valid for some versions, or
> at worst a bug that requires checking the compatible (even if these
> are much rarer when there's a version register, they're still possible).
>
> IDM what number you opt for in the end either, it could well just be the
> lowest number where the current register offset/format for the version
> number register exists.
>
> It's a bit hypocritical of me to ask this, since I have not yet written
> one for the Microchip stuff - but I think you should document whatever
> numbering you end up on, like in xilinx.txt and
> sifive-blocks-ip-versioning.txt, so that we can point people at it.

Best regards,
Jorge
> >
> > Adding David to the thread, since the axi-spi-engine already moved to
> > `v%u.%u.%u` format.
> >
> > Best regards,
> > Jorge
> >

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
