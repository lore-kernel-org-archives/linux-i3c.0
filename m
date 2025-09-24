Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD012CAC5AE
	for <linux-i3c@archiver.kernel.org>; Wed, 24 Sep 2025 17:01:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OZrTBybBfk1LKYIBw8L8F6PDTl/dfxSm0CVeBKu3I+g=; b=cWh8VEdWkkO+2v
	SwGBeEdvISyIYi+LgEVuyrGQI2oCeg854n/K3Oser4E6w7pfQqnnQ8WTDF2Mqs88gwVdNTYQa91nJ
	ATYHQPzANlZVD0UX1lBWZ2NRBswRNpyp/yjyjWr/Cf7XKLa/Nblstbr41ZO0Kq+eTCnZtXl+DYUOK
	IPXqKlf3sXGNH28pU5YaCuLjEDYx6fmEWKFBJZOgWTjHZ2w72wGnLZwoDq+nlaamBODzmFLBx8tyV
	z66lSa3v88TKyFx7+IYyw79g+kIJKfPlaybyaMtqVYpybFK7u+ZKQk/MeLzD06X8DCY8h4/Gw/GEl
	8YKMlndErjUKA/Pnz7hA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1Srq-00000001vmV-2aRy;
	Wed, 24 Sep 2025 17:01:22 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1Sro-00000001vlA-1aLW
	for linux-i3c@lists.infradead.org;
	Wed, 24 Sep 2025 17:01:21 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-45df7dc1b98so156855e9.1
        for <linux-i3c@lists.infradead.org>; Wed, 24 Sep 2025 10:01:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758733277; x=1759338077; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Lb1Ytn+s2dBu+tB6z44h+rNvHohDKVN/ISjnJeqZ824=;
        b=M95q40Tl7gLRyNFg1EEcb/weuVghJSNKjQetIbQlZ8v3vjh4kuOOAZzE5d57o3gOQX
         8oOKQtNPuOu61eBXoITs9U+5bCL9ksoJtaHhd+y/ICW1nitMn8XiwKtdLHuDXu1r6c0d
         kiqL/TS08dhr1u1yU4eyLAudVDTRIg06eCu7E6UdNNqwRWsIVRy+j0O9humntRWhxOK8
         ZZUzgLc20gxI8Or317PnIOVOMdLR686GuoWJwXlRZvGH49KMhJlq7XhFvM7QBkExzvNc
         cjtSrb+M4Irxv1WMhvXRltDVDN7GlQn6QmhezBEOd4XtTq5WyUGF2stiduHR26WWCuDm
         0O3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758733277; x=1759338077;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Lb1Ytn+s2dBu+tB6z44h+rNvHohDKVN/ISjnJeqZ824=;
        b=XWEbST+li90chEyxqy/BAV9ccUAy3I2fZA7P+Xbvm76GbvVRsWKG+2u4Zl1uEo+4P+
         v2GOYEkwJaZU7UJXwqi6tdupR0nFIbMKubqRQnO01plTaD1GwrX0DXt/K0VFHgcPdLiu
         9KpEobT3vcuumf22G2nWFx0t7HSbmK5pZm/umbrfPZxlyLiCvsfGd4KN9JiHU9mfQsr7
         Bgf9NiEBlY+gdwIX8PrRHrfU/5kHDF+XBUzrMPYRWFdXK/F8HhpcjnuD8CJXf/EnX0lz
         9zSm+hq/xsX5KTgQ6LHXCs1hHiEjfE5pT+G1sF4blhO/O6gBA1mvgeitQFYEnYcpmPqo
         Diuw==
X-Forwarded-Encrypted: i=1; AJvYcCUD8c4XO43lOFijQceNVuLNgGudjO99rFfcqZb/ZtKyR70CjFhSLLLdoAd42NijmVjHjk5Cfet3XSw=@lists.infradead.org
X-Gm-Message-State: AOJu0Yw4iMNVspwgTT5M2mOJIuU7wvrxAtLnkGlVoQ7Gob1VB1iO5cuY
	Gf7TpRWrf99Be7uL+xVpH2EKBHmcQIY5KEV7dqFvn3PW6zmn760Uc1eJ
X-Gm-Gg: ASbGncs7ARfAXshWJFTPHwxfOw2cIpRc2JU8dGgbeEoxWR1tFxWVMJMe6+f1LFqqSFU
	icTuaE/M841ZGfnzcLConJa289gXhZDSYvIpGx6C4T4uGoGNzuaz4AMDATsn2OmKcWj8ltlgcyE
	7XDnIns6h9crPwee9gKJpYhJp95T3mBn4m3lvFUnhAbJfSD221QfHM7mpt+djX94N9L3qO0z4/E
	s6EEkKuUTdWv8ndJoV9Qt8dUhmOKCoLEv5dT5yZWdsDJot86mOXNrIGotpkzV5kLST4N0lwFIF2
	lbceyl6KsfflqTHnO6sgPQ0wrvzt+TbAqwndMEWf2jgVtr2fUFsqFnEQ0qLehdpD/JnQHTq/IxK
	8c1WvPewfbQ1cYytvgzWms3X1aIyUJtGBiqEbD27ADSEO7m0V/1JEeg==
X-Google-Smtp-Source: AGHT+IGuVO19RegLvgYvdtil4v4o1WifBE24BkssKL5llgP4b9PHI/slKUeCYP2I53rQ3oYbANYa4w==
X-Received: by 2002:a05:600c:1716:b0:46e:1cc6:25f7 with SMTP id 5b1f17b1804b1-46e329b4039mr4550345e9.9.1758733277071;
        Wed, 24 Sep 2025 10:01:17 -0700 (PDT)
Received: from HYB-DlYm71t3hSl.ad.analog.com ([137.71.226.91])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3ee0fbf53cesm31045345f8f.59.2025.09.24.10.01.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Sep 2025 10:01:16 -0700 (PDT)
Date: Wed, 24 Sep 2025 19:01:13 +0200
From: Jorge Marques <gastmaier@gmail.com>
To: Arnd Bergmann <arnd@kernel.org>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>, 
	Wolfram Sang <wsa+renesas@sang-engineering.com>, Jorge Marques <jorge.marques@analog.com>, 
	Frank Li <Frank.Li@nxp.com>, Arnd Bergmann <arnd@arndb.de>, 
	Manikanta Guntupalli <manikanta.guntupalli@amd.com>, linux-i3c@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] i3c: fix big-endian FIFO transfers
Message-ID: <ikwkapgsfntog67hwi2aapdadlq2wy7oydjz6i75gbhgxxd6fc@3e3lxh7xkgy6>
References: <20250924150303.3601429-1-arnd@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250924150303.3601429-1-arnd@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250924_100120_434850_398F1C6E 
X-CRM114-Status: GOOD (  26.17  )
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

On Wed, Sep 24, 2025 at 05:02:53PM +0200, Arnd Bergmann wrote:
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
> MMIO registers.
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
> ---
>  drivers/i3c/internals.h | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/i3c/internals.h b/drivers/i3c/internals.h
> index 0d857cc68cc5..0f8a25cb71e7 100644
> --- a/drivers/i3c/internals.h
> +++ b/drivers/i3c/internals.h
> @@ -38,7 +38,7 @@ static inline void i3c_writel_fifo(void __iomem *addr, const void *buf,
>  		u32 tmp = 0;
>  
>  		memcpy(&tmp, buf + (nbytes & ~3), nbytes & 3);
> -		writel(tmp, addr);
> +		writesl(addr, &buf, 1);

Hi Arnd, thanks for catching this,

Indeed, writel and readl are byte-swapping and the patch introduced a
bug. At include/asm-generic/io.h:

  __raw_writel((u32 __force)__cpu_to_le32(value), addr);
  ...
  val = __le32_to_cpu((__le32 __force)__raw_readl(addr));

While the writesl/readsl use the __raw_* methods without the byte
swamping.

Can you fix, as Nuno pointed, to:

   		writesl(addr, &tmp, 1);

as in the original drivers, and adding this information to the cover for
further clarification.

Thanks,
Jorge

>  	}
>  }
>  
> @@ -55,7 +55,7 @@ static inline void i3c_readl_fifo(const void __iomem *addr, void *buf,
>  	if (nbytes & 3) {
>  		u32 tmp;
>  
> -		tmp = readl(addr);
> +		readsl(addr, &tmp, 1);
>  		memcpy(buf + (nbytes & ~3), &tmp, nbytes & 3);
>  	}
>  }
> -- 
> 2.39.5
> 

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
