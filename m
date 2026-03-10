Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 190ABFCC9DB
	for <linux-i3c@archiver.kernel.org>; Tue, 10 Mar 2026 09:26:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ydkVl7qRcH9hFvuXLkx2u517f8aA+PiN4tyxieA5KIA=; b=VYqOEmbx8BX2G3
	uCof6bPID75VUDl/5E0ZB5m/UXqqAt1k4qyKBt0nlJ4aKUITrXZkpK3yyKmShCT/gj3puH0cxL+2l
	kvZukT8qkdrFg8NFJwLIaCzZu/SkufjzORcvzP8F0dgBlNjqe2KtW9SNObqvxkaJgVJp8rFvb59K7
	z/xatKv3ZmdD+Y/3E/EwHGtdVOQLgc6V85xk02B5PvrdTidYpQYAp4/ChDfc46CM4jh9Ob+Tbvmlm
	RxMipfgPtOFvzadCzvd2HUq0j5izsfNTc3zbHXgKH2+q4iBO84LbG0cMFS2xNToGABsvRz8pm7bD5
	aXurGiS7eM3Zuda318AQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vztLn-000000095JK-3Vso;
	Tue, 10 Mar 2026 09:26:03 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vztLm-000000095J8-1RPn
	for linux-i3c@bombadil.infradead.org;
	Tue, 10 Mar 2026 09:26:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=a6AEjt/HKBKk6o6xAxhEksykEV/720qA7nughq3Ozvc=; b=bwBLIrKnMeNkLCUbT6MwCdz2O9
	9FvZYkT+SL+dhbrz+AwET5vkZm5J9Q45IK4CnHvNVGigJI9ztjtTt6ajBk7+ajNwNTz+eNuW5FHel
	2lz//mr7Gem08+6EPILgP4TPvqPRg2VESA4FMGOSAz84atYc6CPk1guS7WCSFkyOPHG1fyK+whZ1M
	aukz6N7wixAwZHink/EOnZq9rvYLGSiimeIzfsKT9cETN+JRLq66uaGZM7qKNWBl1f4EnARPAa5MN
	vHjjhn2tGGu+q6bgBBnG001ZCMt/KBrjQBu2rKoYvWnStcyFJUDxBWPC/SPL/6PCdqixtpTBcDWZH
	HDLeqjyg==;
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vztLd-0000000E79D-0jlJ
	for linux-i3c@lists.infradead.org;
	Tue, 10 Mar 2026 09:26:00 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-48540355459so13261845e9.3
        for <linux-i3c@lists.infradead.org>; Tue, 10 Mar 2026 02:25:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773134751; x=1773739551; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=a6AEjt/HKBKk6o6xAxhEksykEV/720qA7nughq3Ozvc=;
        b=O9bGR93IltiolpxdCIG0D6F01jNLMPMeGBMXMasnnnQFOBNkyMDXeRRgYmkrFTKF//
         UcXybzncjhpPrncb4t5qDLos/+Pqdz2Dv+6sTdEWE1LISKuJozaCP1/D5VQQleZ6dcPz
         pKzTFHu8kmCTh7q9Gl2qyyd/QyuUJyEdKA5TnD77aRe2Wu4oe/6UI2A420vrplqLqsEq
         e84qQAF3FtEFvPEWuCIJuVWE/Hj4MUgGP2NzayZpzLIadsyM/4YjT+svrg0xlk2Ipcqp
         xFpwlIflOPzxO+sdtvWR71PcuWbaS2nTq2fqhWJ9uxkM+iV09L15YSQfb46s1b4zpjo6
         VxxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773134751; x=1773739551;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=a6AEjt/HKBKk6o6xAxhEksykEV/720qA7nughq3Ozvc=;
        b=CNBxHHFdKcuECFiXESHVHpsfVjp6odomKLkvwREujdKzmF3QDQ/pP9XhQ6OXy3ylKl
         wkoDmP57T0G6gzCw/Ij9rgPxjkiUw0PTJlLldqcqFBEOkmlC/uM7G3SqGhxJcKg7UTKK
         OVHT9a3NWhEvHh0xvzo9J55tiLCtVnOQBKYMi3pflAKkFhc+0rppIkZe/D+7l4ELSwdY
         9ebLcKRksX2/t++BkicgnNfVnLL+G1j2o/U3EGAa/CFvoSV2crtzNfTevASUfTV3TXNE
         JG+4iC5Fom+JcQjOF5Qo37ko6Or4qS7hDv9mFoNijU3VvqiZNLzhv/D/iELLFtxLBpZG
         OlGw==
X-Forwarded-Encrypted: i=1; AJvYcCVJRpuhijV86h3ULrjwQIuCOlQ6BYmyrMeFFgnWboKZAeNfKuR1D1x7Yd2ljpT6wSY80tiLLGM/AC8=@lists.infradead.org
X-Gm-Message-State: AOJu0YwCOB9A+BO2YK3rEWkHvKiPbdJtxXRP3FX38iSoCbgMEZKB9clr
	krla4/ySX/+NDv/zcEvdvxqnit45LC0ncEgpC8fKgBPaYb5jAl7eMY0B
X-Gm-Gg: ATEYQzx40u+uCkINnSYX5z65cet3f12mlvXJ2MsKT2KHq/DRUH65wEVLRskIMIhDTkl
	7KBH4uQo4F5SKACHIsJj5tvX+BRlzwVijA3fIm0vzI2hxjiA4PztnydNd4YtPBUcLZgAyeuMyZ/
	Z6/HiJvKVkAigKiVjwsG5QYQw4I5Xk0USLW+FmbmruqyrgiUucJa94rpAOHTnShV6NuWAmXCPl8
	sVKo1MOrV3nFu9jxAV7M6W0I4biTowrT00FJB1Ad2jVjfslQ8KViMsfFJvbHOkz+aPbPS92jxd/
	EwITKKKFy9hH42wKWEKiwddtUKj+P56Fixg+4qXSKcsA0kfMwgM0BA9qFUqef1i7Y6oIyORFjCz
	zYJQU5a4ivmtMa3u9rutOAM7NhaEGB2mZxt+qjh94B5MeMQG4/WN/Nbgk4tJUM6dwjzWXuGiHrl
	LiukAt5WANbhAb9t9VH+WR8hLQr7rnHl7glk9GqAywB7AZPD+sMcsRc+dzdqy9RvzjID5masVd2
	w0pyn57LinB5DQAWIUEDdxxo0TIOvYEPk0iPGrITnPZ1FrdnkXsZhVKMww2H0B4vg==
X-Received: by 2002:a05:600c:3b82:b0:485:3bb0:194 with SMTP id 5b1f17b1804b1-4853bb00605mr100756565e9.35.1773134750550;
        Tue, 10 Mar 2026 02:25:50 -0700 (PDT)
Received: from HYB-DlYm71t3hSl.ad.analog.com ([137.71.226.102])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48541b8d4easm63376895e9.15.2026.03.10.02.25.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Mar 2026 02:25:50 -0700 (PDT)
Date: Tue, 10 Mar 2026 10:25:46 +0100
From: Jorge Marques <gastmaier@gmail.com>
To: Lakshay Piplani <lakshay.piplani@nxp.com>
Cc: linux-kernel@vger.kernel.org, linux-i3c@lists.infradead.org, 
	alexandre.belloni@bootlin.com, krzk+dt@kernel.org, robh@kernel.org, conor+dt@kernel.org, 
	devicetree@vger.kernel.org, broonie@kernel.org, lee@kernel.org, Frank.Li@nxp.com, 
	lgirdwood@gmail.com, vikash.bansal@nxp.com, priyanka.jain@nxp.com, 
	aman.kumarpandey@nxp.com
Subject: Re: [PATCH v6 6/7] i3c: hub: Add support for the I3C interface in
 the I3C hub
Message-ID: <zidtovc5pe4mzneeehwang5vf7b5fjnj7wzjafmmvll43xcwdz@eaiusmdzyv6w>
References: <20260310065727.3759342-1-lakshay.piplani@nxp.com>
 <20260310065727.3759342-6-lakshay.piplani@nxp.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260310065727.3759342-6-lakshay.piplani@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260310_092553_407038_D8F223D8 
X-CRM114-Status: GOOD (  16.85  )
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

On Tue, Mar 10, 2026 at 12:27:26PM +0530, Lakshay Piplani wrote:
> Add virtual I3C bus support for the hub and provide interface to enable
> or disable downstream ports.
> 
> Signed-off-by: Aman Kumar Pandey <aman.kumarpandey@nxp.com>
> Signed-off-by: Vikash Bansal <vikash.bansal@nxp.com>
> Signed-off-by: Lakshay Piplani <lakshay.piplani@nxp.com>
> 
> ---
> Changes in v6:
>  - Add support for the generic I3C interface in the I3C Hub
> ---
> ---
>  MAINTAINERS             |   3 +
>  drivers/i3c/Kconfig     |  15 ++
>  drivers/i3c/Makefile    |   1 +
>  drivers/i3c/hub.c       | 459 ++++++++++++++++++++++++++++++++++++++++
>  include/linux/i3c/hub.h | 107 ++++++++++
>  5 files changed, 585 insertions(+)
>  create mode 100644 drivers/i3c/hub.c
>  create mode 100644 include/linux/i3c/hub.h
> 
> diff --git a/drivers/i3c/hub.c b/drivers/i3c/hub.c
> new file mode 100644
> index 000000000000..9cdea8635327
> --- /dev/null
> +++ b/drivers/i3c/hub.c
> @@ -0,0 +1,459 @@
Hi Aman,
> +static bool i3c_hub_master_supports_ccc_cmd(struct i3c_master_controller *controller,
> +					    const struct i3c_ccc_cmd *cmd)
> +{
> +	struct i3c_hub_controller *hub_controller;
> +	struct i3c_hub *hub;
> +
> +	hub_controller = dev_get_drvdata(&controller->dev);
> +	if (!hub_controller || !hub_controller->hub)
> +		return -ENODEV;
> +
This method returns a bool, this is a signedness bug.

Regards,
Jorge

> -- 
> 2.25.1
> 

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
