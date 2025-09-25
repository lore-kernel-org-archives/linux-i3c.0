Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2AE27CAC5A5
	for <linux-i3c@archiver.kernel.org>; Thu, 25 Sep 2025 07:16:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZN7W7qWFkt1e2K4eYep2EcSpo2ugXHTGMFuqBTLhfRQ=; b=nQRXsRk1aV9S7r
	s3TumI1ViJ/sKlwemikoJfow6+DdEnZth9nwibvmVV8UjbkTl1hHHiKi9ZkJQHWJclN6WlI/HTcvp
	dHg5rVkCsLDbUFylMJI/8YGMKFaCBVb5pIrbaiOuYlmF59u5Xfyw6I5C1Cc23le9Z8ofm6QunE31I
	qSA+pk4b1FNTTIlHRjO5uJPjdvq2pj550ziWXDSSOW1I0IdB/gSMvT+Dl1Z5K775MzSrC9d4yAoA+
	Gf47N4R1RzTV6YB+KHORPGxm3dG/0cgs8UjHMfpBFyzHSCqTCyKB6qH7WSaXvolhsZn4Gjn2IAbZm
	qNtrCGXNG91zvaHJn6Hw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1gDX-00000006d00-3s9h;
	Thu, 25 Sep 2025 07:16:39 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1gDV-00000006cyj-0mO8
	for linux-i3c@lists.infradead.org;
	Thu, 25 Sep 2025 07:16:38 +0000
Received: by mail-wr1-x42f.google.com with SMTP id ffacd0b85a97d-4060b4b1200so700678f8f.3
        for <linux-i3c@lists.infradead.org>; Thu, 25 Sep 2025 00:16:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758784595; x=1759389395; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=8Up56yeXe5seXQKdJy3u5l5LSHA9K6cXydBHqXSkVjA=;
        b=j5LduhjVdfRB3/1v62wjrpu5j1tdTSDALEMEDDqOd5cqMOGcKBSMDGG+hc3V2TAblk
         jmQPulfyH43VzU17RpumttHJokOPA12g9AzTauVNG2d+1O/0LTbYvtVt8ZzMJavaKfcH
         AEJTqholGzQByNFhhCnI42Fx2j0gfewTOKQ7RuLlftUafPC6fqr7wPSXhNlaj+aUtDRh
         zY5/ysflhkZ/9mwR6XYzCC8OlCf7OfnvZwdcXN5Pw4Di6qsIPwrPXyFDN6Xd8XmrTO5U
         tlCrgLHoaS5IfQxDUqH3rp6SqVAo3ZeUFkh5xMViXkeGTOPyUS/jwAYQMml6Fa7p4u90
         2v7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758784595; x=1759389395;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8Up56yeXe5seXQKdJy3u5l5LSHA9K6cXydBHqXSkVjA=;
        b=R8v14stWuK9HiQxQOu2RMZtlUT4onYnrgrrBUlWlmtNB5FxTATz6B2zjnypzbezYAR
         g6DNLTQf/NzFVujklG7Ry6KZBmXfHKBYaTaNkRACbI6rvtmvlTNmzzQ00t+9+XdDvBOA
         kXIugX4KBMddn27hgFXzj+HAC6K3esmNXNySHlECVa1dDKj402d4XLN7VqlJHzi7QQKF
         xuERg3dsT6XbQiDqdiK33va+oE3DMjEeWqaXBHAKZBL9dtH4gjtaaWBmLgznt7OqqLsn
         egKLjxnDC3YX4O5nkLDziMNsV4ejkCcsqaGS8yw9MJMZBV+u/ba8cgfDdaSEvHmmjXbq
         FbaQ==
X-Forwarded-Encrypted: i=1; AJvYcCWFCdOH49q/iYf0R9dZU2qQETtwjj/iw5O682iJMHXANNiTF6Ty4xtOCJL6PSZwHMMmBCxqAWoDHXc=@lists.infradead.org
X-Gm-Message-State: AOJu0Yw+9CK3FeF9WTw3A7Iyi1vjNtzCv+JD5PoM5O069Ju2xJVhmicc
	WFCxVOPAfN/Y4S0vrYQBaOlUW8800jDgJHbuOhVzrjLWQSapNawo4yxY
X-Gm-Gg: ASbGncu0aA7Dw8rERSMKARk2hR06Asv3FVVLOCy8mC09rEmH8t0Du78JmiReGxVEjdN
	6aldk1r25esh7eTz5AkDOnLdqedwKfp/x6uV4OLfAbaY71+SbZOu1ieALxuG5f/+agqOCTTCdt8
	rIoo5747P66NTFp31mcFxQIVcFX+rN746Dey8M7UqRMl6I5K2E7OFC/eBdA63uWjuS5pM7AAS7V
	7uJKkZrc3IQAWYQlM2XAOzWHyxYn/X2lbcx1Fx1CMl+jhSrC9/Ab8xgcQShLzvPI5LMz06txnhM
	xZxKxj4+v6pi5M+Kj5p7bx1+DBu36u3in/PHeztlRGDWi0qoQsvMBkeA3OZT/lQubxELj3n2KWh
	S0dq4Lh8wmC+2OH6/ECZSshOdhFvgFi7iSfiiHo6C7xA=
X-Google-Smtp-Source: AGHT+IEHcboXnBOyHaAZASOT1VSfKPdv8Bjhgsa8EFn5kSV5CqA5cEeATY+PMl/LCbvVXM/l2xI09g==
X-Received: by 2002:a05:6000:4382:b0:3d5:d5ea:38d5 with SMTP id ffacd0b85a97d-40e47925a6bmr2769248f8f.25.1758784594858;
        Thu, 25 Sep 2025 00:16:34 -0700 (PDT)
Received: from HYB-DlYm71t3hSl.ad.analog.com ([137.71.226.91])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-40fc5602f15sm1667407f8f.39.2025.09.25.00.16.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Sep 2025 00:16:34 -0700 (PDT)
Date: Thu, 25 Sep 2025 09:16:32 +0200
From: Jorge Marques <gastmaier@gmail.com>
To: Arnd Bergmann <arnd@kernel.org>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>, 
	Jorge Marques <jorge.marques@analog.com>, Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	Frank Li <Frank.Li@nxp.com>, Arnd Bergmann <arnd@arndb.de>, 
	Manikanta Guntupalli <manikanta.guntupalli@amd.com>, linux-i3c@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] [v2] i3c: fix big-endian FIFO transfers
Message-ID: <2wtpklapw5ogsevuvk2l4ngvw7hymer2y4cc454h47u2d7tq44@4mknmpk5yzil>
References: <20250924201837.3691486-1-arnd@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250924201837.3691486-1-arnd@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250925_001637_239671_83032874 
X-CRM114-Status: GOOD (  28.40  )
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

On Wed, Sep 24, 2025 at 10:18:33PM +0200, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> Short MMIO transfers that are not a multiple of four bytes in size need
> a special case for the final bytes, however the existing implementation
> is not endian-safe and introduces an incorrect byteswap on big-endian
> kernels.
> 
> This usually does not cause problems because most systems are
> little-endian and most transfers are multiple of four bytes long, but
> still needs to be fixed to avoid the extra byteswap.
> 
> Change the special case for both i3c_writel_fifo() and i3c_readl_fifo()
> to use non-byteswapping writesl() and readsl() with a single element
> instead of the byteswapping writel()/readl() that are meant for individual
> MMIO registers. As data is copied between a FIFO and a memory buffer,
> the writesl()/readsl() loops are typically based on __raw_readl()/
> __raw_writel(), resulting in the order of bytes in the FIFO to match
> the order in the buffer, regardless of the CPU endianess.
> 
> The earlier versions in the dw-i3c and i3c-master-cdns had a correct
> implementation, but the generic version that was recently added broke it.
> 
> Fixes: 733b439375b4 ("i3c: master: Add inline i3c_readl_fifo() and i3c_writel_fifo()")
> Cc: Manikanta Guntupalli <manikanta.guntupalli@amd.com>
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
> This was a recent regression, the version in 6.16 still works,
> but 6.17-rc is broken.
> 
> v2 changes:
>  - add code comments
>  - write correct data buffer
> ---
>  drivers/i3c/internals.h | 12 ++++++++++--
>  1 file changed, 10 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/i3c/internals.h b/drivers/i3c/internals.h
> index 0d857cc68cc5..79ceaa5f5afd 100644
> --- a/drivers/i3c/internals.h
> +++ b/drivers/i3c/internals.h
> @@ -38,7 +38,11 @@ static inline void i3c_writel_fifo(void __iomem *addr, const void *buf,
>  		u32 tmp = 0;
>  
>  		memcpy(&tmp, buf + (nbytes & ~3), nbytes & 3);
> -		writel(tmp, addr);
> +		/*
> +		 * writesl() instead of writel() to keep FIFO
> +		 * byteorder on big-endian targets
> +		 */
> +		writesl(addr, &tmp, 1);
>  	}
>  }
>  
> @@ -55,7 +59,11 @@ static inline void i3c_readl_fifo(const void __iomem *addr, void *buf,
>  	if (nbytes & 3) {
>  		u32 tmp;
>  
> -		tmp = readl(addr);
> +		/*
> +		 * readsl() instead of readl() to keep FIFO
> +		 * byteorder on big-endian targets
> +		 */
> +		readsl(addr, &tmp, 1);
>  		memcpy(buf + (nbytes & ~3), &tmp, nbytes & 3);
>  	}
>  }
Reviewed-by: Jorge Marques <jorge.marques@analog.com>
> -- 
> 2.39.5
> 

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
