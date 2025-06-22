Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 750EBC7115C
	for <linux-i3c@archiver.kernel.org>; Sun, 22 Jun 2025 08:31:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0hhQhGPG3ysmvqQCrp7KxRmeIrhHHUoMa+wUPe0rPZI=; b=3Fn+bH3xVD71Sm
	Y56FuhTuXg8FyE6d2AHAQRChnh6v2sK04xDK3Minj4AzaJf+Ul3QhV5FlraMsA/EFDr3uoKgiRgtJ
	Q3RFL1qV0ouRXWSQJ/dDRFe6r3eeiD46UptisEjHlJbhU/lh4AjKPQCHkIfhYjaVNdDIp5YNQxgjT
	jpISe5pCb8M2R0scrhHFNm2botOOTbj/3SBCj57iL5TGCddvc/4fcgdIKOv+qV/b3UXohywlesHyT
	fVqFOTJyXVRKcgDITXuzqh2o3Ux4nASW5/u7nJ/grVWhSqJi1Y50M5ELU6hiq2P9v83jq+8G8sKdi
	i0rp7casCy/RA+uhjK8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTG6k-00000000dUA-0SGP;
	Sun, 22 Jun 2025 08:31:22 +0000
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTG6h-00000000dTp-0dy0
	for linux-i3c@lists.infradead.org;
	Sun, 22 Jun 2025 08:31:20 +0000
Received: by mail-wr1-x42e.google.com with SMTP id ffacd0b85a97d-3a528243636so1867545f8f.3
        for <linux-i3c@lists.infradead.org>; Sun, 22 Jun 2025 01:31:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750581077; x=1751185877; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=PPldOG1Bzc8WL3Z0YGlfMcNARm20zqpGMY+YUO0H/Kc=;
        b=U6dBCvLjfBidbP25WRVugQoWVGXBzF2XtemfOyy0UAiXn49Z7VGeLGBn9Dc9OeoREa
         X7zelmXlMs+DJqrPEBlvi1qbQ/KQ8wY89cAJiBbKfmBpWJtuY7IamUVFrorbyG/3DZyr
         VYQQsfl6nL0pPu7xEMtEtTM5zgRcUtHyCrOwlQ1+kKEcTQhyoMogZnUnCHF7TnIcIWCb
         a6b4TiStMfgwcRGnSa05BbhBst6ty1TSVeJ178Ia7bI84CcqZMowkuEmAd31XBzB6JJL
         x8KPGF9MNNbE/P/YMpK4YKn806nhp6rqG8/ddBuWdm2Dn0f/Zn2mXdf1oViNixQr2lht
         Olmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750581077; x=1751185877;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PPldOG1Bzc8WL3Z0YGlfMcNARm20zqpGMY+YUO0H/Kc=;
        b=RE+dhKB0vk5hD04CXDaSDmXn6/x6qDvckMH+BUEM+R9u801lUxmaPsB4scGK/gJDEK
         bjGs0QE0IV4jTgEJjBYOotfe7uZRyoahDwbHMmwuWLxKWLjfytKSPL2iw+pKU+fld8Pb
         hgvpBfPhyxhckfTOtjqqEnctEMMefEC/n48/DV8Q8BBL4kyUI5GDl3GP/mqW+ZgT0+wd
         IDNcoYxu0GOAx7BjhF5msbuJBlMkgaaFDhkje+EoHm5WjV5NBuIhPzbsFD0VKroM0P+F
         Qw4CTBMdJyviDwQAThgkrAvwN5j/Jx3Kr1NwXssh48l1cxQGuP20U3O707Wr6OAPRrVp
         w1MQ==
X-Forwarded-Encrypted: i=1; AJvYcCW+7VgLOVyWt8HUatCqQkQoSN/OcepxqfewaMTMEVmrpWT35bnvAtCyI0Z0jJhTBqeF1L+f1i1I0iA=@lists.infradead.org
X-Gm-Message-State: AOJu0YyxWkfm2L7B84pEDs4CzkeYML3JKiaDDYEbdA+1uUim/h0MGK3C
	AYmNWztoE4ATHovuC/5Nhp8r/abgXpfMje+19FUa0kiuXeyQUfr6QvPj
X-Gm-Gg: ASbGnctnK/yrpDOladpnjNeGrA8bJvRC18ybtI8Yy4UjQf+ktC0xyGGhlIWOEWAULkt
	C81AYpwUyX9hsEQ/yuDi2r1X8wU5ABgDyp2fGH+nu4K/iIrWvliZd46pEscuOxRcgLjqvZwOTAy
	oFOyg7RuONaOVEH4HHV+9iXpZwGUiDvqoJHsRHaTq3atvKDWzZfXeNwRzfBXsXx/dqhlgroJ+KP
	RsCFSjp3iC7sgICBORDX9xiXbRg9RnRyiwP+cvZ4oO3UxdwbdhQumjtzZdpdOXkfPQz8AYL2zmu
	fHjIVaTsKzFjdiw2Bw6fVaVYjixUBoYkimdAFVY8WwwmKt38w1a/tK57k9fwDYmcjCl/fLgqGBg
	P2w4oZ17Nk6Q=
X-Google-Smtp-Source: AGHT+IHQs5acA6zjKZ8lH0avLduGPS64M3j/5dlm9zJID3GUEhZp54uYM9dXMxOIUg1lXOc1KSWdTQ==
X-Received: by 2002:a5d:5e88:0:b0:3a4:f63b:4bfc with SMTP id ffacd0b85a97d-3a6d12d909bmr7896433f8f.34.1750581076851;
        Sun, 22 Jun 2025 01:31:16 -0700 (PDT)
Received: from HYB-DlYm71t3hSl.ad.analog.com ([2001:a61:12d0:5a01:b4d7:fc8d:4cb4:dd35])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a6d1187e5fsm6471224f8f.70.2025.06.22.01.31.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Jun 2025 01:31:16 -0700 (PDT)
Date: Sun, 22 Jun 2025 10:31:14 +0200
From: Jorge Marques <gastmaier@gmail.com>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: Jorge Marques <jorge.marques@analog.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Frank Li <Frank.Li@nxp.com>, 
	=?utf-8?Q?Przemys=C5=82aw?= Gaj <pgaj@cadence.com>, linux-i3c@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] i3c: master: Add inline i3c_master_readsl and
 i3c_master_writesl
Message-ID: <ngtav2drgruaqyuwhhwdlsaex3c7fz5hbex47nzflabcwst2ln@6bmr73eqfzri>
References: <20250620-i3c-writesl-readsl-v1-0-e0aa1c014dff@analog.com>
 <20250620-i3c-writesl-readsl-v1-1-e0aa1c014dff@analog.com>
 <aFXPXTUSvgj-a2zC@shikoro>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <aFXPXTUSvgj-a2zC@shikoro>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250622_013119_192367_C4AEE529 
X-CRM114-Status: GOOD (  13.73  )
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

On Fri, Jun 20, 2025 at 11:15:09PM +0200, Wolfram Sang wrote:
> On Fri, Jun 20, 2025 at 06:54:59PM +0200, Jorge Marques wrote:
> > The i3c abstraction excepts u8 buffers, but some controllers have a bus
> > width of 32-bits and don't support flagging valid bytes, so it is
> > required to read/write long words and to use memcpy on the remainder of
> > the number of bytes by 32-bits to not write/read outside the buffer
> > bounds.
> > 
> > Signed-off-by: Jorge Marques <jorge.marques@analog.com>
> 
> Suggested-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> 
> > + * i3c_master_writesl- Write bytes to long memory region from byte array
> 
Hi Wolfram,
> Frank proposed the name 'i3c_writel_fifo' which I like a tad better.
> Opinions?
>
I don't oppose the change and I'll rename, as well moving the method to
internals.h

  i3c_master_writesl -> i3c_writel_fifo
  i3c_master_readsl -> i3c_readl_fifo

Best Regards,
Jorge

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
