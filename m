Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85CC1C71157
	for <linux-i3c@archiver.kernel.org>; Wed, 18 Jun 2025 07:15:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=D2VmEjdGG5+6nAZBS9BIzKDz1A+j+lAtmYpH7khRack=; b=R6ojswyg9k/AX6
	98l6P1MIjT2V0Qvup7/pV1iUhghB1WkNXjSk39nHt/S0Wsnd6Z6z7NU7mlCpcWm3QDzwb8ZKdosfe
	aCBMEHqrF6UVRFj5AAGg79Xa+m++vD/s1aQyFDQE9+ejBrfHC/g2HbngDGdZN5Rddb6zOvZgeJm6M
	KWKBKqQx8Q0JEBaffi25J2hz8uQv4kWSxPDFx4FxMofZvxmiqp5f2ikEXMlmUQHd72tAj2l/MLdDm
	vMWspYq8HVobksOAq5RkThW6F+mBzgoEQ6Tzo3BGrEJnc1WRBI535z0CUqecHS6sTeTYMUQR1wRLD
	iedYZjvEjEGTHLad5mLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRn13-00000009GwP-0zGZ;
	Wed, 18 Jun 2025 07:15:25 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRmvu-00000009GWN-35Eb
	for linux-i3c@lists.infradead.org;
	Wed, 18 Jun 2025 07:10:08 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-453398e90e9so36396125e9.1
        for <linux-i3c@lists.infradead.org>; Wed, 18 Jun 2025 00:10:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750230605; x=1750835405; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=blHlfMe+5CBJc/TGBy1gRr5vofntcL3F+SvJ+oaL4XI=;
        b=OVky+f1aggmQj/jbLnovs3uV6nlIlbsn9Weg/wi8LfZhNwebIW9Y5nWPavWjk4ZQJS
         8V6NybUbooga5BERNrx3RMg8lD4yWh43ZhaPy7IeSOmSjnCVz9UmG8H3S94aza8688Lz
         Tqx6OwdbEtU1dr+iQrysHZEUla7AbRDMEPl06IBZZejSGeIb21JmwA3kVmapq+KtskXl
         t7+XYRDmrgvd8oDTOqGw91orhTmiuszU5tMRP0f9FOqKW9QgHozkUqjcYvlRa+T08M6J
         KqlFcxPo2vKKpdcA8umeI+fGa9KE+L45T33pl7DaKtNehgtNyrHMygUFLTN4TMRv7T7t
         WWaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750230605; x=1750835405;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=blHlfMe+5CBJc/TGBy1gRr5vofntcL3F+SvJ+oaL4XI=;
        b=rwdVl1KY6bLCynCfa57O5AYv+0THE7/ivgwUlbFErpgmD1AMB6vHp5E5gfTlNzwT11
         ChWmMZV4NmY64d3y4j+NfxfndRDL2EcJM2dgtA5yNAuwiAQw1Hm5Es7sVebWIrnFe7Cf
         m09DIa+/hUyoY3U27lRsDbDbxxd6a4A7F/IG9a8QdnfWjG/Xs2Zf/QwNpM9b3G+6PVGb
         lJUay/5MN+PLjprewk6g1n5ur09CZYnh30vKjiT/GOSvrurlGAVGLgI/YVaDMfAB6PYN
         MEpiyPuuvGDjG5W+QRx337y2JQJSxCbupEj4+DPCGTR5cDKJ7559761HX93V9x9Nnhec
         4+vQ==
X-Forwarded-Encrypted: i=1; AJvYcCUbZazT811bj3/fKG3/sEJpIaEHX/rI9Hiw4brpxXlBj+WIwmRuH9TxqomtUt1h9HxjNZ9k/nPP6EE=@lists.infradead.org
X-Gm-Message-State: AOJu0YypEm05ZZBSUnv03IKr2bFYNg92sNU9Ku2NFuaouCjX2tKkxiaK
	CIGK93AsiGdTWie6W9Lq2wlxFmp9G0Ir96jm0z6uzMY4DQQleYdXxA9j
X-Gm-Gg: ASbGncs6QdnabVXJcTmZymSY6NmUUOG7lcLz2EIMRPsM1EVlrBm/iX6mUDMJ2C2lCe5
	ELtwiImY7hez6Q/TsbrmyWXZRG+wvEiZ79MkJJmyNSPr8OGzeVzcgVIg4QY7PqBoE0H/Bte0/UK
	XoVoZym1u+VSH1MPydeOh8kyslHZ0ud6kj/5DtIjHoQpYVYFN8E/rcQ9Cu7mZNH/BaaNGyo9ikl
	GCvRTUxdvfPdX6xSWxUZBP0oehc0RjCbR6q789IBBRLNEtIqPU+IS4XqPERNFmba0UXAqLC/Sh0
	8wR6c8Gag3aZAilbyztX+iGCOcelGKMgsm8oNzqY7+YuI1QxAyYci92VGIb8uE7S0IVyj0HDZJ1
	ag7XPPhc=
X-Google-Smtp-Source: AGHT+IGbwEhIWV4IKMQ3WRcacP8pkDAtcfY/QWEP271EBcrbZmLFg+GQMV3so/GYmhjA/VhLeTRu7g==
X-Received: by 2002:a05:600c:b95:b0:450:d012:df85 with SMTP id 5b1f17b1804b1-4534b4d8ad2mr103112555e9.18.1750230604970;
        Wed, 18 Jun 2025 00:10:04 -0700 (PDT)
Received: from HYB-DlYm71t3hSl.ad.analog.com ([137.71.226.91])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a568b70d77sm16171244f8f.94.2025.06.18.00.10.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Jun 2025 00:10:04 -0700 (PDT)
Date: Wed, 18 Jun 2025 09:10:01 +0200
From: Jorge Marques <gastmaier@gmail.com>
To: Conor Dooley <conor@kernel.org>
Cc: Jorge Marques <jorge.marques@analog.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Frank Li <Frank.Li@nxp.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-i3c@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] dt-bindings: i3c: Add adi-i3c-master
Message-ID: <qg2l6wfzaquxepeubxgrp2xdbdsfqam3vpzc75sar66jhpc3zn@wi3yk75lebo2>
References: <20250606-adi-i3c-master-v2-0-e68b9aad2630@analog.com>
 <20250606-adi-i3c-master-v2-1-e68b9aad2630@analog.com>
 <20250606-sliver-freeing-d01268258c25@spud>
 <ildi2pup2zkyv4stuknkrjysex3yzsbrrsrwbgcc4xgvdhwrdd@7qh4y6mutgy2>
 <20250617-pawing-octane-a983fbf7100d@spud>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250617-pawing-octane-a983fbf7100d@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250618_001006_772596_0CD1D84F 
X-CRM114-Status: GOOD (  28.15  )
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

On Tue, Jun 17, 2025 at 04:47:58PM +0100, Conor Dooley wrote:
> On Tue, Jun 17, 2025 at 04:50:43PM +0200, Jorge Marques wrote:
> > On Fri, Jun 06, 2025 at 05:08:45PM +0100, Conor Dooley wrote:
> > > On Fri, Jun 06, 2025 at 03:21:02PM +0200, Jorge Marques wrote:
> > > > Add bindings doc for ADI I3C Controller IP core, a FPGA synthesizable IP
> > > > core that implements the MIPI I3C Basic controller specification.
> > > > 
> > > > Signed-off-by: Jorge Marques <jorge.marques@analog.com>
> > > > ---
> > > >  .../devicetree/bindings/i3c/adi,i3c-master.yaml    | 63 ++++++++++++++++++++++
> > > >  MAINTAINERS                                        |  5 ++
> > > >  2 files changed, 68 insertions(+)
> > > > 
> > > > diff --git a/Documentation/devicetree/bindings/i3c/adi,i3c-master.yaml b/Documentation/devicetree/bindings/i3c/adi,i3c-master.yaml
> > > > new file mode 100644
> > > > index 0000000000000000000000000000000000000000..e7fae394ad8fd4143eb1fffb9591a30a2d6cc6ac
> > > > --- /dev/null
> > > > +++ b/Documentation/devicetree/bindings/i3c/adi,i3c-master.yaml
> > > > @@ -0,0 +1,63 @@
> > > > +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> > > > +%YAML 1.2
> > > > +---
> > > > +$id: http://devicetree.org/schemas/i3c/adi,i3c-master.yaml#
> > > > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > > > +
> > > > +title: Analog Devices I3C Controller
> > > > +
> > > > +description: |
> > > > +  The ADI I3C controller implements a subset of the I3C-basic specification to
> > > > +  interface I3C and I2C peripherals [1].
> > > > +
> > > > +  [1] https://analogdevicesinc.github.io/hdl/library/i3c_controller
> > > > +
> > > > +maintainers:
> > > > +  - Jorge Marques <jorge.marques@analog.com>
> > > > +
> > > > +properties:
> > > > +  compatible:
> > > > +    const: adi,i3c-master
> > > 
> > Hi Conor,
> > > Seeing this with no versioning info is pretty suspect.
> > > The adi spi, pwm, axi-dmac etc all have versioning info, please try to
> > > emulate that.
> > > 
> > > Otherwise, I think this is okay.
> > > 
> > > Cheers,
> > > Conor.
> > > 
> > The driver checks the IP version via register access, for the other adi
> > ips, the -x.00.a suffix was never updated. For example, the axi-dmac
> > current IP version is v4.5.64 while the compatible still is 1.00.a and
> > there is a mention of v4.3.a in the binding. It is unclear whether
> > suffixing it with "-1.00.a" would be useful, or if the time comes call
> > the new "adi,i3c-master-2".
> > 
> > Do you still think it is necessary?
> 
Hi Conor,

> I do, yes. In the other cases, if a new version comes out that has some
> sort of meaningful difference a new compatible can be added. Until then,
> using the -1.00.a one is okay.

Ok, I will add the -1.00.a suffix,

Best regards,
Jorge


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
