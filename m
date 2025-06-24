Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C034C7EE33
	for <linux-i3c@archiver.kernel.org>; Tue, 24 Jun 2025 08:59:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9oc524wOJcXmWf1CujHAgwu24q7wTNXbTxb95KkcRAU=; b=r1wUmsVZG9cfcU
	X+bvIIBFufs97Zd5n1Za4TX4+2sgdvbGbuo/eq3RrnOS7sBqXKbONLI/23p6ZGZvEQq9AtOB/wngi
	4yQ958ltmCj6SDf7ceP3Lf1sJBnkWvOeZk57U5iynoXsuUFBFqCT6FZWjbdZkI5Ez+mEomgqzHlxE
	XKWTC1XLj5CxtsFyAp3lkx584OgWqvKcJJwSlCUg/6QaQTG6KUXIZNlTSIEFR/Kgq1Pv6huHFAFP+
	m2CJht4VEs8Lo63flgugNp6/0FWoCq1AjOjNQVt+pMwVAKPygmpQ4s9vNgDlBR4kyY3vl/jtn9tVh
	F9EU44sJFwrKxy03MT2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTzVR-000000056bF-0nmK;
	Tue, 24 Jun 2025 08:59:53 +0000
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTzMC-000000055HG-0WYh
	for linux-i3c@lists.infradead.org;
	Tue, 24 Jun 2025 08:50:21 +0000
Received: by mail-ej1-x62e.google.com with SMTP id a640c23a62f3a-ad1b94382b8so37316566b.0
        for <linux-i3c@lists.infradead.org>; Tue, 24 Jun 2025 01:50:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750755018; x=1751359818; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=EHpmU23em8yN1qh+7DH7e9w7FK3AHCkOn2wEo6h9tHE=;
        b=eIVwCiYd4XWJvIK0oFksjxP6wMUUr/sW9LcNf938hP6idO0cDEotP++ms+qcAKZ/iB
         pJXOLRSff+TrYBbIxTLAGlua6Nk8qkp4WuEbpFtkLIg82Zr0q/dFAtRW1xFzhulc173B
         mzGOSanTDixDgeDDjvpKeP08DjGbya924G2xlwKl3kFGUdbCq0eycLEaNGdckLZVO8Oa
         Rw241MbNvZwzgsjfzSGFC23eZasawvYOjmICQ1L/VsxQtxdf4RD9ig24Y4c2cZSP1oLf
         mXupHPbFCJDkELS87y6LWGx/BvIM5QR7C2BRc6r4r7wVfHML8pXaH1xsoCtKwh2T1JfC
         tPZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750755018; x=1751359818;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EHpmU23em8yN1qh+7DH7e9w7FK3AHCkOn2wEo6h9tHE=;
        b=Vn/DdWTbHeuFku9Z4kCD/VcYqFy4MRP0+sPP2oH+lQi8aKV9MaszGstA5uTUkd9VRz
         V+V6XIC+7cIfo4wrmQ/7SLrOLQVRSX/nV6A8hzOKPAmUBRXC7Ej3LNI0bDbkvPZRsqMK
         zdveLMoiJnm9pwQ3f8E9U5NdzTiQkiTfgn9xXOX0FdNYS4S4rd/Gh9IM8tac59DMxWGl
         78zK84KtB6TsSikgBwrU/J6gE5/lHkLlFLPMh5bODyaRjRVrq7ci+fLLWi4RFQ4Id9xJ
         r1R5h1EHL7ytV8jGbTg0toXeRkcqjlyrcf58mBC+WlhcroVVKCfPCmla3vZjXCWsfbBD
         H0aw==
X-Forwarded-Encrypted: i=1; AJvYcCUDP/UqU/11JchnenpqCxO0pLamAgwMi0VqNMjN/6LrcOdqHdHd/6LKPt3g2YFR27cM5vd/z81Dc4o=@lists.infradead.org
X-Gm-Message-State: AOJu0YwKcuylNonY7hyMnPIvZ3fjmsCgdXlJxWYguQeU+EYgahiZgbnp
	e1VeKZ4Iq9wUMFTkmQt0zz4HffyvmTskghkkNFZo3BwqOXD/PnXEk6oGWwf8Pb6dojw=
X-Gm-Gg: ASbGncuEvTKl4DIfLMPHYnn3ckihU0uU2jIYtOac5D0slgrfrbOBrFNMuwXRVz3YC9M
	RaVdkbbvvTHtgoKIrNKLFswVw0gxe9rTuaTNBoWfBGzHUPlDxaaOV4Eu3K7h0OtDtPW5rlCvieH
	VMteLmRtPsj+eAErExqEibK5i1yNkqQrLY/EZ6Ti9U87n9smcIfGOrc3oacB2u2p1rT59MFeNiL
	1TuFmuagHjOVHGN+pXdpKiO4rMKxjiwchgLbJEtdlAbquigoZ7uj7chyt+eZYiCMFwao3cYEioI
	WJv7fRJubh2bFOqxJquYMPb8qkLLXn1TbjhlWWz0EzOgMurXYK6BecNEn1vxpjycx7g4mGj7XzS
	N4VhloeE=
X-Google-Smtp-Source: AGHT+IGveatgUdV49WyOW3zS3s00AfqE2JvL6i015zyHkQaCi8dmlojKIdOMuDGYIIzX7KUs0CHMjA==
X-Received: by 2002:a17:907:8688:b0:ad5:45d6:5fd5 with SMTP id a640c23a62f3a-ae057b61756mr1390536066b.30.1750755017804;
        Tue, 24 Jun 2025 01:50:17 -0700 (PDT)
Received: from HYB-DlYm71t3hSl.ad.analog.com ([137.71.226.91])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae053edc0e9sm854150266b.54.2025.06.24.01.50.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Jun 2025 01:50:17 -0700 (PDT)
Date: Tue, 24 Jun 2025 10:50:15 +0200
From: Jorge Marques <gastmaier@gmail.com>
To: Frank Li <Frank.li@nxp.com>
Cc: Jorge Marques <jorge.marques@analog.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, =?utf-8?Q?Przemys=C5=82aw?= Gaj <pgaj@cadence.com>, 
	linux-i3c@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/3] i3c: master: Add inline i3c_readl_fifo() and
 i3c_writel_fifo()
Message-ID: <kkbswsflgmfl2khbtwnlsntyzpublt666ozgv7snw4sbv2oteh@ry4wvwkz7uxz>
References: <20250622-i3c-writesl-readsl-v2-0-2afd34ec6306@analog.com>
 <20250622-i3c-writesl-readsl-v2-1-2afd34ec6306@analog.com>
 <aFl2F+AEa6S1iA/h@lizhi-Precision-Tower-5810>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <aFl2F+AEa6S1iA/h@lizhi-Precision-Tower-5810>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250624_015020_186580_C7897FF9 
X-CRM114-Status: GOOD (  25.35  )
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

On Mon, Jun 23, 2025 at 11:43:19AM -0400, Frank Li wrote:
> On Sun, Jun 22, 2025 at 11:18:58AM +0200, Jorge Marques wrote:
> > The i3c abstraction excepts u8 buffers, but some controllers have a bus
>                       ^ expects?
> 
> > width of 32-bits and don't support flagging valid bytes, so it is
> > required to read/write long words and to use memcpy on the remainder of
> > the number of bytes by 32-bits to not write/read outside the buffer
> > bounds.
> 
> The I3C abstraction expects u8 buffers, but some controllers operate with
> a 32-bit bus width FIFO and cannot flag valid bytes individually. To avoid
> reading or writing outside the buffer bounds, use 32-bit accesses where
> possible and apply memcpy for any remaining bytes.
Hi Frank,

gotcha,
> 
> Frank
> >
> > Signed-off-by: Jorge Marques <jorge.marques@analog.com>
> > ---
> >  drivers/i3c/internals.h | 37 +++++++++++++++++++++++++++++++++++++
> >  1 file changed, 37 insertions(+)
> >
> > diff --git a/drivers/i3c/internals.h b/drivers/i3c/internals.h
> > index 433f6088b7cec8c77288ee24dbee8b18338aa1eb..88887b12122efafac81bcfdd093d943259e13a08 100644
> > --- a/drivers/i3c/internals.h
> > +++ b/drivers/i3c/internals.h
> > @@ -22,4 +22,41 @@ int i3c_dev_enable_ibi_locked(struct i3c_dev_desc *dev);
> >  int i3c_dev_request_ibi_locked(struct i3c_dev_desc *dev,
> >  			       const struct i3c_ibi_setup *req);
> >  void i3c_dev_free_ibi_locked(struct i3c_dev_desc *dev);
> > +
> > +/**
> > + * i3c_master_writesl- Write bytes to long memory region from byte array
> 
> i3c_writel_fifo - Write data buffer to 32bit FIFO
> 
> > + * @addr: Register to write to
> 
> FIFO address
> 
> > + * @bytes: Pointer to the data bytes to write
> 
> bytes and nbytes is too similar, can you rename bytes to buf?
Yep
> 
> Check read_fifo also.
Ack
> 
> Frank

Regards,
Jorge
> > + * @nbytes: Number of bytes to write
> > + */
> > +static inline void i3c_writel_fifo(void __iomem *addr, const void *bytes,
> > +				   int nbytes)
> > +{
> > +	writesl(addr, bytes, nbytes / 4);
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
> > +static inline void i3c_readl_fifo(const void __iomem *addr, void *bytes,
> > +				  int nbytes)
> > +{
> > +	readsl(addr, bytes, nbytes / 4);
> > +	if (nbytes & 3) {
> > +		u32 tmp;
> > +
> > +		tmp = readl(addr);
> > +		memcpy(bytes + (nbytes & ~3), &tmp, nbytes & 3);
> > +	}
> > +}
> > +
> >  #endif /* I3C_INTERNAL_H */
> >
> > --
> > 2.49.0
> >
> >

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
