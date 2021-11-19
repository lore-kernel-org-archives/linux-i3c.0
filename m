Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67B80C433F5
	for <linux-i3c@archiver.kernel.org>; Fri, 19 Nov 2021 23:16:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:
	In-Reply-To:Subject:cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BEzyfpFKxlbqb/hDm3CPrDEiCVA/kce1es2uT9Nxatg=; b=nP4tH0KUfnDCFg
	QFnVODcw3cwHPfOTp+4Njxo8NTjQWz/JwkFrSn2ea0Huv+cjVtOzYZsndhNqUHWV0q2167MeCtR2j
	Ztxo7bfUKpAg4AZaB9sly5o/eRvSXXhBZndR8NERKsbEidsg7spLZucR3GIFK6YQYVB6WkcCRbrE7
	Da83tnHqiS9CJQKyqYesRnTf/JEv1s+X61VEnhePd3d9hLar0xlsKCsZVUuxRiAbkCGZA+uObCEQw
	hsNGScrsdGhj3jcVbCw/AY3poZ4CSBkAMUHWqGchahkxx+Msa7t8eLrvLijze+Mvx1gOrDh4YdfET
	3QpWFvAhXfxC7216/Ogw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1moD7J-00Bmby-DE; Fri, 19 Nov 2021 23:16:25 +0000
Received: from mail-qt1-x82b.google.com ([2607:f8b0:4864:20::82b])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1moD7F-00BmbF-Fu
 for linux-i3c@lists.infradead.org; Fri, 19 Nov 2021 23:16:23 +0000
Received: by mail-qt1-x82b.google.com with SMTP id n15so11045286qta.0
 for <linux-i3c@lists.infradead.org>; Fri, 19 Nov 2021 15:16:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=date:from:to:cc:subject:in-reply-to:message-id:references
 :mime-version; bh=fbwBJ/7tiZLlAuTyZOPjLj3If2zENx0mjR578iDfOxc=;
 b=1LQa7aZRgvqMkeKew1B2mxBN5z+USyumxJWCWTLNOi1sJQY2TsOJjxcEJd426ke5wj
 eaypq55uSRNBK5tpr9fL6ZtZ4QJiP326mmEITMpqmhSgmE1q20oJtey/YiahYF3Z55MJ
 qEi5Eev3BylFxPt6YqhSWDfAHjox2p9UOISooubR4WdLLu/uSPzaDR50K9oF8D4Ey6kt
 Rki0oJ4v8zjYG2qivZ/cnohgJHyGuE6NUggpvOpfQYR4yvNtXzBM57R6TH3v/fGbMKGl
 dnPZFrmSzmFMevlxGCkNdmQ5Or7zR1Skm954alYGy28UF2+6nxgIuh9bXCtAR/lRMQt+
 c69Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:in-reply-to:message-id
 :references:mime-version;
 bh=fbwBJ/7tiZLlAuTyZOPjLj3If2zENx0mjR578iDfOxc=;
 b=fzr7HLMl1Ca65fL2+kmxwIO4/KS+mxp5W4+tEIIBDmIMMLZbN+UkcCyoe+ZuwkRbYF
 Zlm5PppPDnUfUc2FtrkruWxn/JURFo125KfkUPMYZ9BXFtRQInsNZWwTIkkd0e3CgT7z
 Uy2R/UiDTV0e71lt8IeDdCtATpu6ND/soNVnaJ0svxOXiwJQnEpUcwSmgre6aR3tlg3j
 QonXFhQ36ni4CrsJU9v8f0DJ3JvdLBQ8PcJL8udv2AMyFuI2bs738zqdYxTYXv1z1Ipi
 eFqFM59KkC6KY7xbN1qKrK5eALMneWEm2P84NSnQxqgfWmkLdI/7TA2fGuyLSdOP+71q
 kG6g==
X-Gm-Message-State: AOAM533rvMojN5cCzqTgG/AaHREGrR40wmR4VwQ2hMeZHmWFo8+Jk0+N
 LlzFK4XJaBMMsoAE2K7d9MAU9g==
X-Google-Smtp-Source: ABdhPJxhHil83yjfhbXuAPxha0HpNEFVV+oaR1l3ki1U2O/b9xob0LbHwhNjMoyt6mKNRcxfExyA1w==
X-Received: by 2002:a05:622a:391:: with SMTP id
 j17mr10615333qtx.228.1637363779886; 
 Fri, 19 Nov 2021 15:16:19 -0800 (PST)
Received: from xanadu.home (modemcable108.170-21-96.mc.videotron.ca.
 [96.21.170.108])
 by smtp.gmail.com with ESMTPSA id k85sm538099qke.134.2021.11.19.15.16.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Nov 2021 15:16:19 -0800 (PST)
Date: Fri, 19 Nov 2021 18:16:18 -0500 (EST)
From: Nicolas Pitre <npitre@baylibre.com>
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
cc: alexandre.belloni@bootlin.com, boris.brezillon@collabora.com, 
 linux-i3c@lists.infradead.org, linux-kernel@vger.kernel.org, 
 kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] i3c/master: Fix a potentially infinite loop in
 'hci_dat_v1_get_index()'
In-Reply-To: <0cdf3cb10293ead1acd271fdb8a70369c298c082.1637186628.git.christophe.jaillet@wanadoo.fr>
Message-ID: <6s9184r-99rn-nr27-174s-r2nqn1o294n9@onlyvoer.pbz>
References: <0cdf3cb10293ead1acd271fdb8a70369c298c082.1637186628.git.christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211119_151621_606974_C6CB4D8D 
X-CRM114-Status: GOOD (  18.38  )
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

On Wed, 17 Nov 2021, Christophe JAILLET wrote:

> The code in 'hci_dat_v1_get_index()' really looks like a hand coded version
> of 'for_each_set_bit()', except that a +1 is missing when searching for the
> next set bit.
> 
> This really looks odd and it seems that it will loop until 'dat_w0_read()'
> returns the expected result.
> 
> So use 'for_each_set_bit()' instead. It is less verbose and should be more
> correct.
> 
> Fixes: 9ad9a52cce28 ("i3c/master: introduce the mipi-i3c-hci driver")
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>

Acked-by: Nicolas Pitre <npitre@baylibre.com>

> ---
> Speculative fix. Untested.
> ---
>  drivers/i3c/master/mipi-i3c-hci/dat_v1.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
> 
> diff --git a/drivers/i3c/master/mipi-i3c-hci/dat_v1.c b/drivers/i3c/master/mipi-i3c-hci/dat_v1.c
> index 783e551a2c85..97bb49ff5b53 100644
> --- a/drivers/i3c/master/mipi-i3c-hci/dat_v1.c
> +++ b/drivers/i3c/master/mipi-i3c-hci/dat_v1.c
> @@ -160,9 +160,7 @@ static int hci_dat_v1_get_index(struct i3c_hci *hci, u8 dev_addr)
>  	unsigned int dat_idx;
>  	u32 dat_w0;
>  
> -	for (dat_idx = find_first_bit(hci->DAT_data, hci->DAT_entries);
> -	     dat_idx < hci->DAT_entries;
> -	     dat_idx = find_next_bit(hci->DAT_data, hci->DAT_entries, dat_idx)) {
> +	for_each_set_bit(dat_idx, hci->DAT_data, hci->DAT_entries) {
>  		dat_w0 = dat_w0_read(dat_idx);
>  		if (FIELD_GET(DAT_0_DYNAMIC_ADDRESS, dat_w0) == dev_addr)
>  			return dat_idx;
> -- 
> 2.30.2
> 
> 
> -- 
> linux-i3c mailing list
> linux-i3c@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-i3c
> 

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
