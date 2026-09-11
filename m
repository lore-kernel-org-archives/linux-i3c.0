Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33474C88E53
	for <linux-i3c@archiver.kernel.org>; Fri, 11 Sep 2026 21:36:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1E8H5E7i3lL9ywiLsOIn99/Kcfg63MmER/r4DuO2Ci4=; b=Rr8r75q37ytak9
	QIVBjklEhplAi4Vr6dRXgfMITC2WvMWLmMzYdGM1RqO2YkIQSK0GkKlEJ+EclCFim2WV6iEtr6rL7
	8V09rE0cHa815DLcTVdT8IgViDcDOyAChlZmy+1YTGI43w0ZFbelmMiwHa+YS5RW95rnx7DiGeTJB
	YVM6j2A7wqtgtT472j3KrxSYxQhnY8/DGFhdnJISTqAlJbKPMeGfpoqSHcjvA7jsGbV/9UTN7HcoT
	unOuwYJv8JBY/CK9GX1v9+M7At7kWFvO4arkwSvA/6S5FvZzxFNsjlKlghjY4qU4uw5LCL14o3Ssy
	8wDc/c9GkS4xGH3fhDGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x58vE-00000000Bbs-1vJG;
	Fri, 11 Sep 2026 21:36:36 +0000
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x58vC-00000000BbI-2Xqd
	for linux-i3c@lists.infradead.org;
	Fri, 11 Sep 2026 21:36:35 +0000
Received: by mail-pj1-x1034.google.com with SMTP id 98e67ed59e1d1-3964e480f76so1906233a91.1
        for <linux-i3c@lists.infradead.org>; Fri, 11 Sep 2026 14:36:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789162593; x=1789767393; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=pAQK5OeklF/DWV0T96iTwyf4EXdJqbJCKpAuQ260Jy8=;
        b=W/61RR9c29V3AHP0vIwKAh4S9QcS/kV4hx4HwWrjvzRaeyK2CSNbXJObIj4+DbDr/2
         xD3nlKMbO/+GLaROHlblMACnBsiO64t7L5D4JbZl3xZNt1LTjuC/f55WZbRXyyRHpdWB
         L6mJCfg0L5rVHIAIlBVdQvgcVcqMe0Lv0NGoUmLqV77uy8zSeAJHdXZCP2+j5T8pHhAr
         Jy/3fL/XhMx75AbeGJvGRG+Wc5BRKOA1JJAS3PSuZyZ+gUoAFwWbXqBCb2N647UpNJou
         5tgfcy1z/xOBlvfj42qJbHzJVSYH8QGpnygSLfD6DXiEspjS67Yi7xIr78J602lBuLxo
         BkCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789162593; x=1789767393;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pAQK5OeklF/DWV0T96iTwyf4EXdJqbJCKpAuQ260Jy8=;
        b=XgWvpgw1MrAMp3uRGKzygOjbxTMPyvtrMyxmHfvq4z6OCL0ORhDr9Awbx+1ha1b8Pd
         YgFT0h3iNYbpcQ6ZS/GjxunGX7GyCqh2lhAa3GUeBb4at15Q8o6fEuMQ6GkCeOZDehsl
         X4R4svkGDtkdY1IitT4Q4rPgwAApBjlTNubBi05FeLy5FpzAGh5cvoD10xGaFHp+oJTC
         O+2dN8kSZ4ifXf3LBhZdlBzcbAUJ/r3g5zAEhCUn8HaCjAyf+heTTuk/XhJnM9OLjaxZ
         zw/xSKDBg8HvkOsPuLCzEI88P5wJJqjG86l0gB73S9m7K18UgNEwXtrBbwhOS6a7Rf/j
         UHkw==
X-Gm-Message-State: AFuF++mi0s0dhg4qPMSYk6dBkqMGcXAdH6qo8EBB5IgYjRejQrWlFgv2
	UTSu6UEBuXraFVvuxnwFxPNjo8Ow9uuVzqYlZvEnFcMrBJNAcm/l85ov
X-Gm-Gg: AYBFou2lUcUETQOcD16XJUngrSibBwLe7rxWDoGso6ibfYQ1uyFAd1ZKlHM9W/CoBBw
	tejxSr6uSTBY5r8uXVhlxRGpupLiPi7/zK1nnnoii6y6L0eRdL86gRSSW4C7TsZdDyzZoMX1QDg
	a+7qyfw39ptYBXFDx658a/wk+dhzUKSooc8u6+VuCtD/lZyY5vEJYo6sluKauxhKPApDJOVt9o8
	8RvgpuU83hvEuiFaUh0qu7l2Q+5bE60dzoz+Lsp74KKRtUtjklpRTiq+CEqU3UjQG4xLCq99G8S
	77ZhDXwBzl9YELMMBLVDmXJm356AGGFPFB8dJ4IzOt7oYReuYzXv7e/DE7ovypRmwk9+vXf8g1I
	Od9mjw/RCG6if57QI1n/c5JLlbgDzTFaYvylWnXv5Ep0Y51TAl9uJ1DeVPeKqgLlNyxhM5nqf1o
	LHlpZkRjkOSS04bx95WV6E4cE39eP4v8SUxVVGIedy/rIG/TFxyC9i0rNELkWqMlXRoECmfo9px
	SPvIHRCuuo+
X-Received: by 2002:a17:90b:384d:b0:398:e1f4:bda1 with SMTP id 98e67ed59e1d1-39d9c22ccc1mr761107a91.21.1789162593165;
        Fri, 11 Sep 2026 14:36:33 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39d9959ac65sm6442721a91.16.2026.09.11.14.36.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 14:36:32 -0700 (PDT)
Date: Fri, 11 Sep 2026 14:36:30 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Meagan Lloyd <meaganlloyd@linux.microsoft.com>
Cc: linux-i3c@lists.infradead.org, alexandre.belloni@bootlin.com,
	vitor.soares@toradex.com, samagazaryan@google.com,
	gregkh@linuxfoundation.org, arnd@arndb.de,
	boris.brezillon@collabora.com,
	oleksandr.shulzhenko.viktorovych@intel.com,
	tgopinath@linux.microsoft.com, corbet@lwn.net,
	skhan@linuxfoundation.org, Frank.Li@nxp.com,
	jorge.marques@analog.com, pgaj@cadence.com,
	wsa+renesas@sang-engineering.com, tommaso.merciai.xr@bp.renesas.com,
	nuno.sa@analog.com, Michael.Hennerich@analog.com, jic23@kernel.org,
	dlechner@baylibre.com, andy@kernel.org, lorenzo@kernel.org,
	enelsonmoore@gmail.com, rppt@kernel.org, pratyush@kernel.org,
	giovanni.cabiddu@intel.com, gabewhigham@gmail.com,
	haren@linux.ibm.com, pasha.tatashin@soleen.com,
	jirislaby@kernel.org, adrian.ho.yin.ng@altera.com,
	ustc.gu@gmail.com, jszhang@kernel.org, adrian.hunter@intel.com,
	akhilrajeev@nvidia.com, tze.yee.ng@altera.com,
	manikanta.guntupalli@amd.com, shubhrajyoti.datta@amd.com,
	jarkko.nikula@linux.intel.com, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org,
	linux@analog.com, linux-iio@vger.kernel.org
Subject: Re: [PATCH 1/3] i3c: master: enable driver_override for I3C
Message-ID: <342236b8-11f0-44bc-b0f3-2f167a6f521b@roeck-us.net>
References: <20260911210935.1353126-1-meaganlloyd@linux.microsoft.com>
 <20260911210935.1353126-2-meaganlloyd@linux.microsoft.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260911210935.1353126-2-meaganlloyd@linux.microsoft.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260911_143634_652412_91601C98 
X-CRM114-Status: GOOD (  11.35  )
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

On Fri, Sep 11, 2026 at 02:09:33PM -0700, Meagan Lloyd wrote:
> Opt-in to driver_override sysfs functionality for I3C subsystem.
> 
> Update some I3C drivers that are assuming that if their .probe is
> invoked that the bus match function already checked the ID table. Go
> ahead and verify in .probe that i3c_device_match_id() returns a valid
> match before using the i3c_device_id pointer.
> 
> Signed-off-by: Meagan Lloyd <meaganlloyd@linux.microsoft.com>
> Assisted-by: Claude:claude-opus-4.8 copilot
> ---
>  drivers/hwmon/lm75.c                        |  7 ++++++-
>  drivers/hwmon/tmp108.c                      |  2 ++

Separate patches for each hwmon driver, please. Each patch should use the
standard prefix used in hwmon drivers.

Thanks,
Guenter

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
