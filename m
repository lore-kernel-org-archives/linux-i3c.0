Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA7DDC83F05
	for <linux-i3c@archiver.kernel.org>; Wed,  2 Jul 2025 12:02:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4I+6xRwmnnf6nuFz4kI30zpt/e4+/VRNrL3RPQTaf1Y=; b=zoxSVQMKung8Wi
	XnAfSXDLO+W8vObYZ++pcK8EcUmwuG4/uxHrLOuQhzjbYsOjMaR+jkXjrvn7RB5TOoMatlP/Lp487
	RWRj/ShSKFRHfB6NtM+bEYBlVU8jkQqcfizIEhP9gb8OXAJWXxMyWaqpAsdqp9y+DqmaWhKtqT+B8
	aa5Cch3jWmCOPSoXvDqTup0TKVvV9a72S/nRAsqYYbcD2u0dTE4dLyJK8TU+c+mOssR3S6ovDMJu6
	8lIDiebek0w7RNuqMCUb4fLhWj9dasdJytllFPnsJLWhnBlyFbUbMgfb4ZYGF+N3ZUcuB1obV0qaN
	BaEdkRbTXwM7XJ14ExBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWwAH-00000008EIo-2G9n;
	Wed, 02 Jul 2025 12:02:13 +0000
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWvAD-000000082Pk-48SH
	for linux-i3c@lists.infradead.org;
	Wed, 02 Jul 2025 10:58:07 +0000
Received: by mail-ej1-x62e.google.com with SMTP id a640c23a62f3a-ae223591067so722387666b.3
        for <linux-i3c@lists.infradead.org>; Wed, 02 Jul 2025 03:58:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751453884; x=1752058684; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=4UQDvStLCCqdjbM2QKt6gHnnOIKDEa8/C2rjjg0SswI=;
        b=d4ccq52wThtyMDNvCkrQoCCNQLGh3uGnmm7aLgwe9jTcpg20z7NqMIi62NpVovzbr7
         Wh7TqGOYC5GM7wmiBegViqHLzcgL6NZ2Outjbn668qoxGF1VZvPsKff3ZVT4xd/A3VIm
         3SBJHsOX16W+i7mbrIaRKlRIM5zUu0oM0nZMeJEyFQFHOiGTXSU1zvj/t5p0FXiyww43
         CEAE46/ETPp825U50OasDftm+dUXpFbqpc8axPbnwl6RL33wwVYjmpAEPZqPxSt/voNK
         WmJiKFgvHamdFY98mwuVid8Bn7N7pzX3vAFiOr04zcPRP4GFUjb0BwBEd5UQWPp7JjwI
         ecrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751453884; x=1752058684;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4UQDvStLCCqdjbM2QKt6gHnnOIKDEa8/C2rjjg0SswI=;
        b=lfKmdKn8mOkPfi6dBlp3IDRi0bMdCKKKcVp2VAUiIrgP8QwNBb9ln2vUxkiYkdcS60
         OK6lHUI0PMdcMb6Ouku9MCkQyEksmS/1piLIVKQzbJHKYtZT9pmC3Yo1HzUsmZViFV4q
         QiHRy6pglgmdtvw9v5+9cjxjC0dunXI812RXrKlolVQsmHTT8vHkOUNUQlBM3F21b1dD
         RZjRhomCrSQgDdqp2I0eDxSUK52T7tB3qznBBXO9wp91SVRpNvNd7vpRTZb6feK+Q7Rb
         8DIuD4zIGCfURedi6ey8f8lJKXF9kklbfaCEEJUctYyfFw/PpDqmy1eRGTeWB9XDqUhX
         aChQ==
X-Forwarded-Encrypted: i=1; AJvYcCWiy1NDTeK6z7yypmJYQuYXliE/XFmg5nWru47Ts3Pzd/9nwY82ZsFBQBTl61O25WxzEhjSFXnsnc0=@lists.infradead.org
X-Gm-Message-State: AOJu0YxQFsShI8LsvI3K7x6UhPYq0CA4A5JrZ8CQ4rThY5lB7z8PEUEa
	Ks5YzL5KC2dl4re4IPvu9Tf/AxJWhY5I10Llnll5VxOixiOqD2ua3M+s
X-Gm-Gg: ASbGnctq1r2pGXY8d+jLLqREhM0V9xRf3ljXi+U0cR9NUFSFsEDbjgDJA3PhTP1EjMy
	VwrFph4VnAVdERfthvevHo4Yre68DVRISrrC0ZkxnFbBlM+I1iMZ5In8jfR9zvWem1ERxP4JTWI
	k3t7P5ecYxdil8MA+UP3jR6GVVcsfJJFsiClmTS66T4lAnXW3bsjtgvPLfWI5g3Yww8YHXvLylk
	uTDNC5c8ZflxjEY+STBfy6oz6n/ErAUvu9WBB2KvUiWNzEgI/9hq3vsKFEfk2l9ltBpU4zapKeH
	49kShs9Q2vFwFnKIhpqG5jLZ4UVi3j8+CaVdGafIrqx/jxabkaFKOahqbBEpY4r1Hc5+Nwu+ajs
	qFoNM6vE=
X-Google-Smtp-Source: AGHT+IEsoB7YBUau4TzIFD9Pd++QxJk8jVRKzBz/JBIA6OBn/guMweMpUf9qL70n0g01Wfz1g1iRgA==
X-Received: by 2002:a17:907:6095:b0:ae0:a0d0:eca0 with SMTP id a640c23a62f3a-ae3c2c4bf31mr216834366b.14.1751453883569;
        Wed, 02 Jul 2025 03:58:03 -0700 (PDT)
Received: from HYB-DlYm71t3hSl.ad.analog.com ([137.71.226.91])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae3c7606786sm79736466b.60.2025.07.02.03.58.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Jul 2025 03:58:03 -0700 (PDT)
Date: Wed, 2 Jul 2025 12:58:00 +0200
From: Jorge Marques <gastmaier@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Jorge Marques <jorge.marques@analog.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Frank Li <Frank.Li@nxp.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-i3c@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 1/2] dt-bindings: i3c: Add adi-i3c-master
Message-ID: <v2ybju75bpjdqxfkell47nlkeyal36ylmnqt2yvpncxnmp2irb@pygx56jsyxkr>
References: <20250626-adi-i3c-master-v4-0-3846a1f66d5e@analog.com>
 <20250626-adi-i3c-master-v4-1-3846a1f66d5e@analog.com>
 <20250627-steadfast-ferret-of-expertise-5c8ff2@krzk-bin>
 <tl5fckhrivaqfyzwyb2o2a7gykpigwend7z2nduqgbbej3hqbs@vxxtsadhtdmt>
 <41782ded-908b-46ef-8f75-4d2565476b7c@kernel.org>
 <cfi6rzhco2ba6pcbk57l7tblimuks5jnpgaly7nbedbrpyhtma@u46if22kurwk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <cfi6rzhco2ba6pcbk57l7tblimuks5jnpgaly7nbedbrpyhtma@u46if22kurwk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250702_035806_031174_F4E28CF6 
X-CRM114-Status: GOOD (  29.79  )
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

On Fri, Jun 27, 2025 at 06:02:26PM +0200, Jorge Marques wrote:
> On Fri, Jun 27, 2025 at 04:49:19PM +0200, Krzysztof Kozlowski wrote:
> > On 27/06/2025 16:38, Jorge Marques wrote:
> > > On Fri, Jun 27, 2025 at 08:56:55AM +0200, Krzysztof Kozlowski wrote:
> > >> On Thu, Jun 26, 2025 at 12:07:36PM +0200, Jorge Marques wrote:
> > >>> Add bindings doc for ADI I3C Controller IP core, a FPGA synthesizable IP
> > >>> core that implements the MIPI I3C Basic controller specification.
> > >>
> > >> How did you resolve my last comment? I don't see any explanation -
> > >> neither here nor in the binding description. Binding description is
> > >> actually better place, I think now.
> > >>
> > >> Best regards,
> > >> Krzysztof
> > >>
> > > 
> > > Hi Krzysztof,
> > > 
> > > I forgot to condense out discussion on v4.
> > > What about this binding description:
> > > 
> > >   description: |
> > >     FPGA-based I3C controller designed to interface with I3C and I2C
> > >     peripherals, implementing a subset of the I3C-basic specification.
> > >     The IP core is tested on arm, microblaze, and arm64 architectures.
> > >     It takes one or two clocks, axi and i3c. If only axi is provided,
> > >     then there is no clock signal to the i3c input clock pin and axi
> > 
> > This is obvious from the schema, drop.
> Ack.
> 
> > 
> > >     clock drives the whole IP. The compatible is suffixed by 1.00.a
> > >     foreseeing future controllers by Analog Devices Inc. and breaking
> > >     changes.
> > 
> > I don't understand that. How are you breaking any changes? And how
> > 1.00.a predicts future? I don't think this reflects previous discussion.
> > Why you were asked to go with v1.00.a?
> The -1.00.a suffix came from this discussion:
>   
>   https://lore.kernel.org/linux-i3c/ildi2pup2zkyv4stuknkrjysex3yzsbrrsrwbgcc4xgvdhwrdd@7qh4y6mutgy2/
> 
> Other adi bindings use this suffix. I personally wouldn't add any suffix
> unless told otherwise, as I expressed on the thread. Should I drop it?
> or suffix it with something else?
> > 
> > Best regards,
> > Krzysztof
> 
> Best regards,
> Jorge

Hi Krzysztof and Conor,

I went after the reason of the historically -1.00.a suffix and
discovered that they came into existence due to AMD Xilinx auto
generation devicetree tool SDTGen
https://github.com/Xilinx/system-device-tree-xlnx
that would automatically suffix with the IP version, defaulting to 1.00.a,
and for a seamless experience, the were copied over to the dt-bindings.

The adi,axi-pwmgen dt-binding went more creative and suffixed with
-2.00.a, while never enforcing Vivado to yield the devicetree with such
value (Major version is asserted in the driver through reg access, the
current core version is v2.1.1)

Testing on my side (AMD Xilinx Vivado 2024.2), it seems Vivado now
defaults to 1.0, so the previous bindings from the other IPs are not
accurate anymore, either, (axi-pwmgen auto gens
`compatible = "xlnx,axi-pwm-gen-1.0";` (`xlnx` instead of `adi`, also)).

For fun, the current Vivado version thinks the devicetree node for the
i3c master should be as follows:

  i3c_host_interface: i3c_controller_host_interface@44a00000 {
          compatible = "xlnx,i3c-controller-host-interface-1.0";
          reg = <0x44a00000 0x10000>;
          clocks = <&clkc 15>;
          clock-names = "s_axi_aclk";
  };

Let me know if we can drop the suffix, or replace with something else.
The current register defined core version is v0.1.0.

Best regards,
Jorge

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
