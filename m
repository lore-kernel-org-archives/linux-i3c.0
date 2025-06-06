Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DAFF4C7EE30
	for <linux-i3c@archiver.kernel.org>; Tue, 24 Jun 2025 00:30:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cvbmqzI6ytWsbP4hYbsZiiWnaWsIq4A3+9dg1JYsnv4=; b=mVLlDHAKAoOK7L
	d5hn0zKplcv5yt1TKcIE9aPdfg68h99/AmprRfsVUwh67pl9cmNw3iHYRcsfptdJZL/uq9Ur1aASf
	krhw9dqeVBcDJH3BE/qVlyxf8dVHOnQjLH7IpY7qHcACk3IYXpw8ETZOG4ibQyJsQhXtNEHzfZ57A
	mLYndMYjnD/aEi5R63nBuWF4tYKjbKln4vmXehUzrK+iUDOXLPxSf55355BFPTx02sObrP4xb7gNI
	0xVuP6U1l9r/L2kjmsn9ZRkxhIfANTeMcAgw9p9IBRYzFkJ/0YUPeDrNGbmy89xkquUL0Q4ZS4bVq
	7SVFcA9JO9M/mFY6uGrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTrYn-00000004Eeh-2DlS;
	Tue, 24 Jun 2025 00:30:49 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uNU6c-000000001gm-1kpX
	for linux-i3c@lists.infradead.org;
	Fri, 06 Jun 2025 10:15:23 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-442f9043f56so10568675e9.0
        for <linux-i3c@lists.infradead.org>; Fri, 06 Jun 2025 03:15:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749204921; x=1749809721; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=NDtFnCkMReqqiUbpjeifRmII/hPtdUlD+iwNu+Nb/uo=;
        b=RoD3XUZXAYeEQ8yRMwiX/SHHxF7xaeFMBEwhKDmuGRjQRy2nOoMf19TCqWDwQR7917
         IW3USSvrV10/4vF4KR0RyQQSUFFYls2rOiJR32kZG2ybGn+5RVs3OXGEbksYeBdrnsxY
         IkQrxRTPQPToi3bZ1vvkNyJGsvKJWbErnIpsloOePXXcUUk0ZYlNFpcQVCSRL07rVkpZ
         tKytdYX4uCTSDaZk3TJahNrYwEH34Zk/TXOTIloZTMJHQcYQxYtPr6nKCHovO6E4eAEL
         pYN831S9T2x2w6M/0C9EOpPbCJozxP9IKrvzoJ2POsw/z4E9+SwGaRu8ewvhN2ZS5vzV
         7j+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749204921; x=1749809721;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NDtFnCkMReqqiUbpjeifRmII/hPtdUlD+iwNu+Nb/uo=;
        b=iD7P0g75toQ+DjaW0DChKNR9FP6To8lB9thXcz12q+NBNITy867UGBzThEVuq9Hneq
         GMsiHdmEnfwE3hsX/WpfSXI9yIqwS5FxJh1FzIhoiaIOO/5PRv3hOl0bEzToB8pXxFOs
         UKBJ143rsiBpIZ559IX/LYZBzKQ94Cd0j0hi2zduolnqcro2bB87Uaflz4wvD1WQ1Enk
         JMlt4w24l/8vXPiuPH/HMww3rE/fw/RacVnuwGeMQ48/a3PtdSYrXr+opr3xuW7kMA9O
         37k7vjeHwLyEKUF32zYjCJjaBwhs3bFP+eoRqiyaEjKhjXJe3HtThCzolhWqWRQM09Fb
         QagQ==
X-Forwarded-Encrypted: i=1; AJvYcCWWAenr9nNvVAKBdio/i2E5jselhG2BBewEpt6l/PDHIMdxW9LFSKrFWAe7GwWZzW2FFDuW0pyFtjw=@lists.infradead.org
X-Gm-Message-State: AOJu0YxRKDnpmU8/nsUE5fl+0VSysWP6EWMGKfTheggVib3/aKYytrZT
	eLnYzVkKPbzLvKDUc3VLxMfe9CBJM1JFWZlvdSrvLof3PKsN2ALwqYVl
X-Gm-Gg: ASbGnctv242/iy6GT90THdgoi9kf9mLiYj+hxHIPjq7GTwYkAXNxr/wERWpg2jZAsfv
	xDN7VwrpqvIveiRlTxqnjofAmTDuJuRRphH5zVyMqocoZEPqVas5r/JherXCY0T8NNuOqMLb33I
	XIx6IiV23Y/PmtNrGNZpQZU5YeqrSdR6d8qiz9aCxBBZqh+lYfKKR5+SaKBIjBGkqII4E0+KX+P
	0xEomvq6W3wcEgbUyKI7NP1+WdJU7wic0R5we81SY1D5Zx7df33I3XsGByEUhZYJEQKP66mNWB3
	iFgfDezEqS3Pdc5cJtjQ91KUdiic0JDWChZD7pdW+EFtJzH80XG+SDhceAslL0TRLFa84yaHqnT
	A
X-Google-Smtp-Source: AGHT+IHkoGqyZU4A8UbDxOXpDq17ie8vVLoKYLh6DutXiqc0wb92kNu+EH/C1X6j+1vj63Y0RhyNSw==
X-Received: by 2002:a05:600c:1c85:b0:445:1984:247d with SMTP id 5b1f17b1804b1-4520136ee1amr26616255e9.7.1749204920556;
        Fri, 06 Jun 2025 03:15:20 -0700 (PDT)
Received: from HYB-DlYm71t3hSl.ad.analog.com ([2001:a61:1225:ec01:d1d7:779d:8019:7bb0])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45213726c44sm19113435e9.28.2025.06.06.03.15.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Jun 2025 03:15:20 -0700 (PDT)
Date: Fri, 6 Jun 2025 12:15:18 +0200
From: Jorge Marques <gastmaier@gmail.com>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	Frank Li <Frank.li@nxp.com>, Jorge Marques <jorge.marques@analog.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-i3c@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] i3c: master: Add driver for Analog Devices I3C
 Controller IP
Message-ID: <kffxck2gorwcdcokh6sf2p6vsnuketjimpbls3nqp6oapo5zdn@3yoxssd4ncxl>
References: <20250604-adi-i3c-master-v1-0-0488e80dafcb@analog.com>
 <20250604-adi-i3c-master-v1-2-0488e80dafcb@analog.com>
 <aECaFQzkPYdfjagK@lizhi-Precision-Tower-5810>
 <aEDCATbPA9173lGI@shikoro>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <aEDCATbPA9173lGI@shikoro>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250606_031522_455304_97327872 
X-CRM114-Status: GOOD (  21.12  )
X-Mailman-Approved-At: Mon, 23 Jun 2025 15:46:42 -0700
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

Hi Wolfram,

On Thu, Jun 05, 2025 at 12:00:33AM +0200, Wolfram Sang wrote:
> Hi everyone,
> 
> On Wed, Jun 04, 2025 at 03:10:13PM -0400, Frank Li wrote:
> > On Wed, Jun 04, 2025 at 05:48:58PM +0200, Jorge Marques wrote:
> > > Add support for Analog Devices I3C Controller IP, an AXI-interfaced IP
> > > core that supports I3C and I2C devices, multiple speed-grades and
> > > I3C IBIs.
> > >
> > > Signed-off-by: Jorge Marques <jorge.marques@analog.com>
> 
> Hmm, I didn't get the original patches. They are probably still in the
> moderated queue?
> 

Yep the patch was held in the queue but are delivered now.

> > > +#define REG_VERSION			0x000
> > > +#define REG_ENABLE			0x040
> > > +#define REG_IRQ_MASK			0x080
> > > +#define REG_IRQ_PENDING			0x084
> > > +#define REG_CMD_FIFO			0x0d4
> > > +#define REG_CMDR_FIFO			0x0d8
> > > +#define REG_SDO_FIFO			0x0dc
> > > +#define REG_SDI_FIFO			0x0e0
> > > +#define REG_IBI_FIFO			0x0e4
> > > +#define REG_FIFO_STATUS			0x0e8
> > > +#define REG_OPS				0x100
> > > +#define REG_IBI_CONFIG			0x140
> > > +#define REG_DEV_CHAR			0x180
> 
> This register set has some 'cdns'-vibe to it. Maybe an earlier version?
> Not sure merging this into the cdns-driver is a good idea, the register
> set looks quite different to me. Note that I don't know cdns hardware, I
> just grew a habit of comparing register sets of new drivers to avoid
> duplicated drivers.
> 

This controller targets FPGAs, in particular low-cost ones. I am not
familar with cdns hw either. Overall the driver is strongly shaped by
the i3c ops, the spi-axi-spi-engine.c (also a FPGA IP) and the other
linux i3c controller drivers.

> Happy hacking,
> 
>    Wolfram

Best regards,
Jorge


> -- 
> linux-i3c mailing list
> linux-i3c@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-i3c


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
