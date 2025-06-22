Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5EA3C7115A
	for <linux-i3c@archiver.kernel.org>; Sun, 22 Jun 2025 08:43:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5+GIVUbveLWpjXJlr8HeRU7gmw7t39TKLzCuHxVuaZI=; b=m9iN4Hm529TvZb
	zqqlQm1TQQUj23cyVdlxKmOlLcWmVb9fI/LYjkwqTkxnbodBWuMaR+V7owqmKOq0F6WfbcW3w7gBV
	Cg0CsGmDAmgqXnTpzUeIHIQmYySSJlyk8z2oAqKVwmMXBF38v99Ga18K/lwuKfxO8r1CVNuCVCKjr
	L2d7HzRdPd+7Q+bVw7ekvMTkhEQ7ya/5tXtM/RNPWag3PclUi/shEMIfJJPl/DYWyon0zv/14smuX
	0kA/glmzyVCsR5cREuCEzfd8q8mrEbNOdRIlW+dVVV2UhbNMupPlxibBj/HychVJ1blSxQQUFE6KC
	MtQLTWNgVJwqISKU7Q0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTGIf-00000000dkE-1KTJ;
	Sun, 22 Jun 2025 08:43:41 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTGId-00000000djs-1dFb
	for linux-i3c@lists.infradead.org;
	Sun, 22 Jun 2025 08:43:40 +0000
Received: by mail-wr1-x42d.google.com with SMTP id ffacd0b85a97d-3a6d77b43c9so876767f8f.3
        for <linux-i3c@lists.infradead.org>; Sun, 22 Jun 2025 01:43:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750581818; x=1751186618; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=962UG/WjfeGvO1clnj/Kvo3yAvg5LKIDDvZZU4WDKpE=;
        b=FMUgOz+sBSKrdGXc13hdfJ44tJzAmcBVdommqMAOQHeLmzQmgR1nHRTl4P8Agmu4RG
         AG1uby0Yaa1bw78rsbAVGNyr03k3ELEmqyQVzvKJNioGL2KlrNwxY3rpThcUuTLCg7yA
         Sk4W7DyW9u5vjB44GXuH+nGacUn8PPiu3tm/6GSOndpgjvLwB+NQNP0runIx+ePeIis5
         hT6qiO+5aYut7+ZE713n6ls5fvXa0tZzHTFLpGWrYxWj1hxIZXL5xqugkBmLIlpM7Pgr
         XYQ7G1wztacNNuuMEYLN3XBJL7c58Kic+LE8QRS0nGCFtPqJbosU5vtDFmLrV0VhwCAD
         kNmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750581818; x=1751186618;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=962UG/WjfeGvO1clnj/Kvo3yAvg5LKIDDvZZU4WDKpE=;
        b=Df7j72ltbfpNrXOea4xV09jgsfsbMdqq6f+8cbG+onGprsf2Zq71GKbDFsXfsBkkFo
         84rjeg1Z9yceZ6JnjXvRuJon81Da6q4MvUq8QMCR2rQf+SbBSru0hIxcRoBQ0LEk6k3I
         ojdmI3DtCXPIV0ayz4iAg/MZ7vTgbEHgqVb7VF9gjfp9a5fzI95RpmK9mgUrJpi46FJB
         zaKMmmSno0iTEvmSCOMfZYsPdYT4d4cH2Xmeksrlk/O/kb4Ek/r6u2btaACdCRs2T2zv
         aoUMZsKin3ht5tkfDxEZMr6LYbskeK96d0W4Zee9Q8fB9hPlZQFL6+FPylmOSX0YnSrM
         XwGQ==
X-Forwarded-Encrypted: i=1; AJvYcCWOQsjeP23ydXtSGnadVr7rKBNts3sm+6Slg2g9HxzEdY5T+gj5U/QvfSIr3rjGJkgfZmHbbAhp9/s=@lists.infradead.org
X-Gm-Message-State: AOJu0Ywq/aGkc9fYhRlK+vT1wIM4kJugbz/QxFbnW/2XijyfvIofaNcL
	tBqM4nXinvxHny6Tq6rGiUYxA75MvY3OQJzYoncAwybrAO66TFnqNgtnAja2MseU
X-Gm-Gg: ASbGncugsr0Q1U1BJdZhB3jFrrgf+dzrvDdDQ0CNybvMFWn2m2fth30kO1bpIFQ25XC
	yjpmh7geUmcsknjQckn9nceB7H2cFc4TL14KaDrkte07itq8HvhdjEBwPfcI8M3mBqyLbdft06G
	syGLzpAV0Zf5aiRpG2U44JOov88C+5brxTM3rVK0GGmb0aCDOCn7qRBRlBmE71zalsvpxohvLdD
	hy2PvYv+FXv5S92uqPY3JCzswb5KIZx4dJ+YITyMQwSSK6UK4jV0y+67+Rw52lay6LlU+cHxipi
	nKwbUytoDOh0iCca1WZGbWabnhqLQiAA43SbRaeOgCksI/UoW0Wh2poL/MwAPGMR6Ac9JTe+ulb
	uVtx52RVnhPA=
X-Google-Smtp-Source: AGHT+IGYvF6Ktr46LKGJGqo5Y7atGzFDJs6HcvtBskYedFf93GhmSAEMG1Hy3kV3R/91xJe9ZSrZUA==
X-Received: by 2002:a05:6000:26c1:b0:3a4:fbaf:3f99 with SMTP id ffacd0b85a97d-3a6d12dd6e7mr7694500f8f.13.1750581817594;
        Sun, 22 Jun 2025 01:43:37 -0700 (PDT)
Received: from HYB-DlYm71t3hSl.ad.analog.com ([2001:a61:12d0:5a01:b4d7:fc8d:4cb4:dd35])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a6d145e520sm6388390f8f.20.2025.06.22.01.43.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Jun 2025 01:43:37 -0700 (PDT)
Date: Sun, 22 Jun 2025 10:43:35 +0200
From: Jorge Marques <gastmaier@gmail.com>
To: Frank Li <Frank.li@nxp.com>
Cc: Jorge Marques <jorge.marques@analog.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, =?utf-8?Q?Przemys=C5=82aw?= Gaj <pgaj@cadence.com>, 
	linux-i3c@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] i3c: master: Add inline i3c_master_readsl and
 i3c_master_writesl
Message-ID: <z6hrfvw3ubkob67k7bvg2qovsxwenh3e76bdtdjgsbnpchniwn@6hxhf3sxynxv>
References: <20250620-i3c-writesl-readsl-v1-0-e0aa1c014dff@analog.com>
 <20250620-i3c-writesl-readsl-v1-1-e0aa1c014dff@analog.com>
 <aFWrSHg2M1lq8kGt@lizhi-Precision-Tower-5810>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <aFWrSHg2M1lq8kGt@lizhi-Precision-Tower-5810>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250622_014339_428669_28FCD317 
X-CRM114-Status: GOOD (  24.38  )
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

On Fri, Jun 20, 2025 at 02:41:12PM -0400, Frank Li wrote:
> On Fri, Jun 20, 2025 at 06:54:59PM +0200, Jorge Marques wrote:
> > The i3c abstraction excepts u8 buffers, but some controllers have a bus
> > width of 32-bits and don't support flagging valid bytes, so it is
> > required to read/write long words and to use memcpy on the remainder of
> > the number of bytes by 32-bits to not write/read outside the buffer
> > bounds.
> >
> > Signed-off-by: Jorge Marques <jorge.marques@analog.com>
> > ---
> >  include/linux/i3c/master.h | 36 ++++++++++++++++++++++++++++++++++++
> >  1 file changed, 36 insertions(+)
> >
> > diff --git a/include/linux/i3c/master.h b/include/linux/i3c/master.h
> > index c67922ece617d6320c0c7e4838c2e7edda8c19f5..11401f2acb42e4d3a60df33b7c794d8a0360cdc2 100644
> > --- a/include/linux/i3c/master.h
> > +++ b/include/linux/i3c/master.h
> 
> suggest move to drivers/i3c/internals.h becaue only master drivers use it.
> 
Hi Frank,
Ok, also renaming to i3c_writel_fifo() and i3c_readl_fifo() as well
reworking the commit messages.
> > @@ -674,6 +674,42 @@ i3c_master_get_bus(struct i3c_master_controller *master)
> >  	return &master->bus;
> >  }
> >
> > +/**
> > + * i3c_master_writesl- Write bytes to long memory region from byte array
> > + * @addr: Register to write to
> > + * @bytes: Pointer to the data bytes to write
> > + * @nbytes: Number of bytes to write
> > + */
> > +static inline void i3c_master_writesl(void __iomem *addr, const u8 *bytes,
> > +				      int nbytes)
> 
> const void *bytes
> 
Ack.

> > +{
> > +writesl(addr, bytes, nbytes / 4);
> 
> fix indention
> 
> Frank
> 
Ack.

Best regards,
Jorge
> > +	if (nbytes & 3) {
> > +		u32 tmp = 0;
> > +
> > +		memcpy(&tmp, bytes + (nbytes & ~3), nbytes & 3);
> > +		writel(tmp, addr);
> > +	}
> > +}
> > +
> > +/**
> > + * i3c_master_readsl - Read bytes from long memory region to byte array
> > + * @addr: Register to read from
> > + * @bytes: Pointer to the buffer to store read bytes
> > + * @nbytes: Number of bytes to read
> > + */
> > +static inline void i3c_master_readsl(const void __iomem *addr, u8 *bytes,
> > +				     int nbytes)
> > +{
> > +readsl(addr, bytes, nbytes / 4);
> > +	if (nbytes & 3) {
> > +		u32 tmp;
> > +
> > +		tmp = readl(addr);
> > +		memcpy(bytes + (nbytes & ~3), &tmp, nbytes & 3);
> > +	}
> > +}
> > +
> >  struct i3c_generic_ibi_pool;
> >
> >  struct i3c_generic_ibi_pool *
> >
> > --
> > 2.49.0
> >
> >

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
