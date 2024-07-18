Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4C94C3DA5D
	for <linux-i3c@archiver.kernel.org>; Sun, 21 Jul 2024 22:11:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=2Z1HYXU876ilQ5IcQA+UZICDrg4vV6kgKVCoSpZT+Pw=; b=cJOlhMhKzNaVhQ
	oo2vkBesxDhP8HWMwYhb8Onntt42RVOSbicY/Nd9sonU5ioe2+MJCekthw4nrGzrh7ZIDjdrJqzyR
	nuLPmrHRsTxabgfEZ5Vj8JIKpnyGQ541FYTZDUBCivKXPLjHfsfeyy/DQLKDjMQoFUDXgt6/NdFT7
	gMkjwCycL0RElQgPpY6t8E5tHFv/6JtZH7To8Ufaw2kVJwGxaRZKAlWmA7i0hvRh/pIk7ANRf+jjx
	qeUDFp7UriGA8R6li922RL6GpNl+/ckvdg24KcZYUqfSXpvnqSDJAHC40a/OqlHOiLi/TPkT7Ed1p
	Kxc6dA877Ao0CcQu6bgg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sVemX-00000007f60-2fBz;
	Sun, 21 Jul 2024 22:11:53 +0000
Received: from mail-oo1-xc32.google.com ([2607:f8b0:4864:20::c32])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sUVtb-00000000LnO-2nao
	for linux-i3c@lists.infradead.org;
	Thu, 18 Jul 2024 18:30:29 +0000
Received: by mail-oo1-xc32.google.com with SMTP id 006d021491bc7-5c691c6788eso552752eaf.2
        for <linux-i3c@lists.infradead.org>; Thu, 18 Jul 2024 11:30:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1721327426; x=1721932226; darn=lists.infradead.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Bu3L66gXFcN3QKFM4M2IyGwT//LPj6mk9IKjJSFoji8=;
        b=TMC7mFJC0NyOlGkTWGXdqTJOb+e5jCfYU4VjApMxNSoAJouDSD3GEmM1KsgGqAOCIb
         zJlX4gNXxRrPhOli/Z+G0BDRX8wOMq5k2RoId7OtlOswDXfqduv1fSmdkXIm6TFAyV0f
         0aqd0SvfeKgLbXkUkJsILgRZKosFRmUK9nmD2aC3bS3lHCE27eLYWGITSpL1qDqKaro6
         TGDr69pDJUhXcxft0HGmz9ETywP2kmEirvAe7IcXhCnlzjmgnmFWxYaDlG2vnsHKPFUt
         lnSLhrYMAqH35Z4U2uOEdb78Sxq5rNA+tkTL1BDSoBpqpfkejMm9iy35d5qhtWX8WMlr
         on1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721327426; x=1721932226;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Bu3L66gXFcN3QKFM4M2IyGwT//LPj6mk9IKjJSFoji8=;
        b=RB6Vxgb8t9wgCP4OhxKJNygKEAwH7L6FBVtZKFPszCstAl139y6ufshWh9s6ThOH+n
         Kt6sjFl9R/hbHLiL8x3G9qX/5VZuv5Jq8NzwcI3I4OqcoiLPhygATrxN97jG5ljypYG7
         WNngLyuDDTI+rcnlFWdu2TvLOeu6dZH7aNISP03+I483wIBlX2PbWuAj43rlROlUUFIL
         iLXGCOTOiBPanAGZt3OOqdoCxMwQR21FTkWUG/AIm43z3I34uwDK9/qqKSZaQqF1VLAa
         ucp26gF9kRCDOdAg294N+u/O2iFGVBkfQ1qaon6lnCRwaCmD/5o8ryMvkPvYrpEkRuai
         5VsA==
X-Forwarded-Encrypted: i=1; AJvYcCXgD+XUUi+X2pIsf5Kzh6NYiRaOv+KWIbOyUIGoH9xYWQGPg1qNpig0ik2KB4oZ7LqCmoevube8JSX1xh27BMDg52iwAh5AgYXIRLkTeA==
X-Gm-Message-State: AOJu0YxRvRNL84mWdPWFVpHMCiao8kbKiBmMTVOlC6beOrCi5WenQBJh
	veaallOiHEdIfmxrwIFPcN9j3jfUupoisbNLlHJoSg9uM+1cBuIm+7wESrmI/CM=
X-Google-Smtp-Source: AGHT+IHfVnIuNs7e/rNBEuwsyQLUJ7M7eNZl5L5eDW+zD/V5s9h31Hxelwx+b54/gMeTAXhX7pudZQ==
X-Received: by 2002:a05:6820:2788:b0:5c6:61b9:20ba with SMTP id 006d021491bc7-5d41a4c1e69mr6849785eaf.1.1721327425729;
        Thu, 18 Jul 2024 11:30:25 -0700 (PDT)
Received: from localhost ([2603:8080:b800:f700:8d5a:14eb:55d7:f0ba])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-5d3ca788101sm641622eaf.16.2024.07.18.11.30.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Jul 2024 11:30:25 -0700 (PDT)
Date: Thu, 18 Jul 2024 13:30:22 -0500
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Frank Li <Frank.Li@nxp.com>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
	Conor Culhane <conor.culhane@silvaco.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	linux-i3c@lists.infradead.org, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: [PATCH] i3c: master: svc: Fix error code in
 svc_i3c_master_do_daa_locked()
Message-ID: <e017edfc-da64-496b-8516-958bec27cd9a@stanley.mountain>
MIME-Version: 1.0
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240718_113027_764671_C7F0C967 
X-CRM114-Status: GOOD (  11.67  )
X-Mailman-Approved-At: Sun, 21 Jul 2024 15:11:52 -0700
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

This code has a typo so it returns positive EIO instead of negative -EIO.  Fix
it!

Fixes: a7809cb368b9 ("i3c: master: svc: Improve DAA STOP handle code logic")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/i3c/master/svc-i3c-master.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/i3c/master/svc-i3c-master.c b/drivers/i3c/master/svc-i3c-master.c
index e80c002991f7..0a68fd1b81d4 100644
--- a/drivers/i3c/master/svc-i3c-master.c
+++ b/drivers/i3c/master/svc-i3c-master.c
@@ -874,7 +874,7 @@ static int svc_i3c_master_do_daa_locked(struct svc_i3c_master *master,
 				 * address this time.
 				 */
 				if (prov_id[dev_nb] == nacking_prov_id) {
-					ret = EIO;
+					ret = -EIO;
 					break;
 				}
 
-- 
2.43.0


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
