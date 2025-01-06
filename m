Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58D60C02189
	for <linux-i3c@archiver.kernel.org>; Fri, 10 Jan 2025 11:19:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SKluww2hD4YR1cbDijTRlaL8IWkS9Qn5BdxHllt7Tqw=; b=zuZpTdxLqhNsI/
	pf5irRWPUlUBJT8JWjyu4y7ZwPPtpXFwvWqnzqWxxEPhwbGWniPQ4oQ0Flc9ePhQTmmUhvj9A+71r
	2rf1YcpGEiRViHYt3zfV3FxHJXbS5Bz2QI/C9h4GB6+cI5KPPZo23WiE+9tZc4R0/G2kPZRRJciAA
	p1OvYCuxltENKK16+PbvmVcL68X7gJ7/rmtw85HeWMTRW0QWWj418SJMwTTiJEXGlSaSc8UQXc5vt
	BJJUH1UtYjadDvJ0OPH5trfxx6L2nincEK3SkOLqAyGpnh9oOG2Oms/J8+wSvHE8JcL+4NZi5EuO0
	DsFm7+ANJ3+qxIXeA6Qg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tWD34-0000000F5bN-0G3u;
	Fri, 10 Jan 2025 11:19:30 +0000
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tUmos-00000001KeV-1IfF
	for linux-i3c@lists.infradead.org;
	Mon, 06 Jan 2025 13:06:59 +0000
Received: by mail-wr1-x42b.google.com with SMTP id ffacd0b85a97d-385ddcfc97bso12159804f8f.1
        for <linux-i3c@lists.infradead.org>; Mon, 06 Jan 2025 05:06:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736168815; x=1736773615; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nR/GknLwYbI9cGNF1TEcNc1etyW/R6QVg5TDhkMuTLI=;
        b=TRXYUtEOa3u797WiV3qSCSIGAL9RRXT6l/euQaAX8UNMM3x4Eu+qJUAWbMkv5DS7v0
         Nmn6lM2lwjeYSksYXTuHsDZx+VDjBWDbaQcvrsWvA9CQu4ygWIfx0URDcrScGsVhdya+
         IL9MUGf/JTgi2Mn6YvNL1NscGVxINuSBrHt7NuWmEDrkMU9o58Of6RWR4mwetZMOx4DW
         D9Sz+8DLENy6ySlxmxd+tbwD12Dtw6RrQM3k3aKcrO/SAbUeN8dMLdp5Ww++U4XLtPs1
         R/FMHpPR2oD1HWd+7TFHDMuTr5fHnXFjsc5SnRCh5YXdiqxhZcW9GgRtLsYVcjAzdRXe
         mbnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736168815; x=1736773615;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nR/GknLwYbI9cGNF1TEcNc1etyW/R6QVg5TDhkMuTLI=;
        b=kIMpBw1uSUf+MfPYKsVo+Lz7XHDAxrXaMK/lIOmGy1fswBAtOBvdSOHNnzgh0wZ1Zf
         +ODz3X823Yn4hemU4lzajG3+Nz2SIW2kuDdnztnVbbjMhj4234FmPQKKDAJ4vu+qrA0c
         gjnrtUyxaPgxxlu1hAbg7Abk2ByospscoOcoV1/LskPa22JrTSogZbNvs/6dJE7B1dl9
         8ky272I9KkRBcYBn72VhGolj/Bc/KnHu6D8BMbbRwCvmihYYbWFO/2EtFyXKZBpau1ON
         pB3RB6pF4DHsZEH0cWVmICs4aXVNrU+M1XqXPUV3OG/AQPM7aNHzZ6lMzOkhHWEcU3OU
         QB+A==
X-Gm-Message-State: AOJu0YxKvXv2lIVL1zEqB+WIzaA9Pn9N8nsH3HP9QkH08hjXIbbHn+Hd
	txb+umx6G8DH3/6adnwnxqUZAzTQDD10euPNRPF7/hYrKzR/LFK7
X-Gm-Gg: ASbGncspb+/WpTP2vlaA3gvFiJuFcMyrA/i+gFtpjN/IbZJaydUKPLR4JNFXP3HlsT/
	RvR+xjICia9LeVIXsYJ7TmA/pgz69VbnFvKDGFZqJMq1Sk/URc4pfZyG9yVzy/eVU8swHUruUrw
	DymbjmnscPRo/Jy4Dgg3sn1S16Talfd0JOWVROnyFDCg8SzbdxvWykPH78W5B3opSmPl1lrIhQM
	2+Yq8Cd4KGzfZvHwqOj/PgpDVqfwluLD3qD9QKfMh7E+TcMu0xFmpjtQCHMeSvqa14xsKBkYunH
	oSa8tPk/FvsWiykQr/w=
X-Google-Smtp-Source: AGHT+IH/LvJCLKxDG2Sz9qhe2NwCXYjjo9fR+gIgkFrd+/H+QCEE1YOZ7L3UGT/7nOlnnoqWiOeQkQ==
X-Received: by 2002:a05:6000:4816:b0:386:37af:dd9a with SMTP id ffacd0b85a97d-38a22201ac8mr53721304f8f.35.1736168815300;
        Mon, 06 Jan 2025 05:06:55 -0800 (PST)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4367086e40esm534085855e9.30.2025.01.06.05.06.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jan 2025 05:06:54 -0800 (PST)
Date: Mon, 6 Jan 2025 13:06:53 +0000
From: David Laight <david.laight.linux@gmail.com>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-i3c@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, Jarkko Nikula
 <jarkko.nikula@linux.intel.com>, Alexandre Belloni
 <alexandre.belloni@bootlin.com>
Subject: Re: [PATCH v3 4/5] i3c: mipi-i3c-hci: use parity8 helper instead of
 open coding it
Message-ID: <20250106130653.7fe81eae@pumpkin>
In-Reply-To: <20250106092725.22869-5-wsa+renesas@sang-engineering.com>
References: <20250106092725.22869-1-wsa+renesas@sang-engineering.com>
	<20250106092725.22869-5-wsa+renesas@sang-engineering.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250106_050658_351880_602BE7BC 
X-CRM114-Status: GOOD (  16.00  )
X-Mailman-Approved-At: Fri, 10 Jan 2025 03:19:21 -0800
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

On Mon,  6 Jan 2025 10:27:22 +0100
Wolfram Sang <wsa+renesas@sang-engineering.com> wrote:

> The kernel has now a generic helper for getting parity with easier to
> understand semantics. Make use of it.

This need to explain that although the algorithm has changed the existing
code is wrong.

	David
 
> 
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> Tested-by: Jarkko Nikula <jarkko.nikula@linux.intel.com>
> ---
>  drivers/i3c/master/mipi-i3c-hci/dat_v1.c | 11 +----------
>  1 file changed, 1 insertion(+), 10 deletions(-)
> 
> diff --git a/drivers/i3c/master/mipi-i3c-hci/dat_v1.c b/drivers/i3c/master/mipi-i3c-hci/dat_v1.c
> index 47b9b4d4ed3f..85c4916972e4 100644
> --- a/drivers/i3c/master/mipi-i3c-hci/dat_v1.c
> +++ b/drivers/i3c/master/mipi-i3c-hci/dat_v1.c
> @@ -40,15 +40,6 @@
>  #define dat_w0_write(i, v)	writel(v, hci->DAT_regs + (i) * 8)
>  #define dat_w1_write(i, v)	writel(v, hci->DAT_regs + (i) * 8 + 4)
>  
> -static inline bool dynaddr_parity(unsigned int addr)
> -{
> -	addr |= 1 << 7;
> -	addr += addr >> 4;
> -	addr += addr >> 2;
> -	addr += addr >> 1;
> -	return (addr & 1);
> -}
> -
>  static int hci_dat_v1_init(struct i3c_hci *hci)
>  {
>  	unsigned int dat_idx;
> @@ -123,7 +114,7 @@ static void hci_dat_v1_set_dynamic_addr(struct i3c_hci *hci,
>  	dat_w0 = dat_w0_read(dat_idx);
>  	dat_w0 &= ~(DAT_0_DYNAMIC_ADDRESS | DAT_0_DYNADDR_PARITY);
>  	dat_w0 |= FIELD_PREP(DAT_0_DYNAMIC_ADDRESS, address) |
> -		  (dynaddr_parity(address) ? DAT_0_DYNADDR_PARITY : 0);
> +		  (parity8(address) ? 0 : DAT_0_DYNADDR_PARITY);
>  	dat_w0_write(dat_idx, dat_w0);
>  }
>  


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
