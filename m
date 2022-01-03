Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 697DDC433F5
	for <linux-i3c@archiver.kernel.org>; Mon,  3 Jan 2022 17:03:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:
	In-Reply-To:Subject:cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=o/LoW7MVN8lodGcrr8yaXVePlSEEmffyX3GLoPOaci8=; b=KskP3JfbROewqS
	dKukREi2i9ZHQr/75wIYsyQAcGsAATMGsfjXdD5lNTn4dAb9hd64cHrYBdJNhj+sFQAbwOiaFqtFX
	OYSZW8CSR/rweMpHDZGg318jd+2nikV7oS+jjv/f/Yvno4MExoKPMDT2hzfrv0k6Dxa0P5uwwKYoV
	BrnbumsKu5zAuNET5LKKcDzUZ8CosTMyjHIrnrcUEfsVk3XOCo8/bEiRHu/oUh8bk7uJO5RLn+5qU
	XhkFB34rXqJqngReQtSp3iBMlFedCwnZEn0XwVbPcxZf1Pa2tNOjmjeL2qDwZxAINtfr0X6XnrKxg
	VtwH+Gq7vEMUovbBijXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n4Qk0-009dCF-MG; Mon, 03 Jan 2022 17:03:24 +0000
Received: from mail-qt1-x834.google.com ([2607:f8b0:4864:20::834])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n4Qjy-009dAY-Ln
 for linux-i3c@lists.infradead.org; Mon, 03 Jan 2022 17:03:24 +0000
Received: by mail-qt1-x834.google.com with SMTP id f9so31014100qtk.4
 for <linux-i3c@lists.infradead.org>; Mon, 03 Jan 2022 09:03:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=date:from:to:cc:subject:in-reply-to:message-id:references
 :mime-version; bh=yJU9zhwni6o3+iZvN5P4ezbbFlptXIDjM38WRcxQ32E=;
 b=noF8JJJJnvfKFqf33bkEgTwyL+UX4F10QJG8qoWpz1rTM/BAcfM4zuoGJ5do4kszrw
 Rg1fvwEhmb0g1xcJ4QtLZ1GUD/qFfGjcMmExVedWogSh8dR7+QqHd43hlZUUyqpWqjtf
 P8BBZZfluylu1FRF7Wof6nn/wMnS8IsuTaMctpLt1gDi/Vat8TpxY47OneRsgqRxA6pK
 k5/XMUE1tLNtJWH7ZVCftAu8fdOstJOPt8ndDb7RMAsm/7oJ2uogNGMkhbEs3ckVXngJ
 fqTFEDvCw60xJ4NKEcx3U+nXrKXjnef5GibvxoAGc/Umf3E3n/qk18l4By+fUUDALHG7
 5+bQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:in-reply-to:message-id
 :references:mime-version;
 bh=yJU9zhwni6o3+iZvN5P4ezbbFlptXIDjM38WRcxQ32E=;
 b=tBEkjhXaTQlMGgRg7GI+tMf9NIzfKt6dh1yvwjtpg4kpezVqbPxKexOtmVbe3eaRKx
 mgJWB027++t9R5DvqLsSSc1I8B1cRYhs724Fttd80rBDQ6E3pMRMYGCnab+/z5ysbWv/
 i+/oWIgnlXwCINrifkl886S03IvCU8J7hdVUvX3oSxMxksREx9/dvtBzQUADD1f/g30C
 NUbnZSzJmKFK526VyavbOw26tZVMHRUdwUACVewHKFLj2YIcPo8zTo7rgBgJsYFQBC+b
 D3/CjaMOqAug9nCBxlsmTgpvETqIrgOhKOUeS8wROI/cItCPODS8zUxaIDDZXE1vAgc9
 ZeKQ==
X-Gm-Message-State: AOAM531LXizBw7QgdrCnpE4vUDsrH2NPMVLNSsHar4Rd/8Pf4j+ypFcf
 ZqLrSG98T6aFukUtW28srIPW3Q==
X-Google-Smtp-Source: ABdhPJzA/SHPa7IwwpIDS2Ewwxk0uyuQatuwrlI5IDc0c1N8Iu658RAeumEbJlcYI0R9FitBZ7/n2A==
X-Received: by 2002:ac8:7fc5:: with SMTP id b5mr40500137qtk.351.1641229399112; 
 Mon, 03 Jan 2022 09:03:19 -0800 (PST)
Received: from xanadu.home (modemcable108.170-21-96.mc.videotron.ca.
 [96.21.170.108])
 by smtp.gmail.com with ESMTPSA id f12sm27848315qkh.22.2022.01.03.09.03.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 Jan 2022 09:03:18 -0800 (PST)
Date: Mon, 3 Jan 2022 12:03:18 -0500 (EST)
From: Nicolas Pitre <npitre@baylibre.com>
To: Lukas Bulwahn <lukas.bulwahn@gmail.com>
cc: Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 linux-i3c@lists.infradead.org, kernel-janitors@vger.kernel.org, 
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] i3c/master/mipi-i3c-hci: correct the config reference
 for endianness
In-Reply-To: <20220103094504.3602-1-lukas.bulwahn@gmail.com>
Message-ID: <3p9691n5-3qs-7s3q-pp9-389621935prr@onlyvoer.pbz>
References: <20220103094504.3602-1-lukas.bulwahn@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220103_090322_735531_D61C15E9 
X-CRM114-Status: GOOD (  18.28  )
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

On Mon, 3 Jan 2022, Lukas Bulwahn wrote:

> The referred config BIG_ENDIAN does not exist. The config for the
> endianness of the CPU architecture is called CPU_BIG_ENDIAN.
> 
> Correct the config name to the existing config for the endianness.
> 
> Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>

Acked-by: Nicolas Pitre <npitre@baylibre.com>

> ---
>  drivers/i3c/master/mipi-i3c-hci/core.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/i3c/master/mipi-i3c-hci/core.c b/drivers/i3c/master/mipi-i3c-hci/core.c
> index 1b73647cc3b1..8c01123dc4ed 100644
> --- a/drivers/i3c/master/mipi-i3c-hci/core.c
> +++ b/drivers/i3c/master/mipi-i3c-hci/core.c
> @@ -662,7 +662,7 @@ static int i3c_hci_init(struct i3c_hci *hci)
>  
>  	/* Make sure our data ordering fits the host's */
>  	regval = reg_read(HC_CONTROL);
> -	if (IS_ENABLED(CONFIG_BIG_ENDIAN)) {
> +	if (IS_ENABLED(CONFIG_CPU_BIG_ENDIAN)) {
>  		if (!(regval & HC_CONTROL_DATA_BIG_ENDIAN)) {
>  			regval |= HC_CONTROL_DATA_BIG_ENDIAN;
>  			reg_write(HC_CONTROL, regval);
> -- 
> 2.17.1
> 
> 

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
