Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B109DC433F5
	for <linux-i3c@archiver.kernel.org>; Tue, 17 May 2022 20:14:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=x9/hQrpl3L53WKbGCWpNqENu3e87w2FusyTtVnwtOeA=; b=BQCM7fPOGP4K2L
	HEugXh6KnIYzCfV8N7K09dGDGv+zIiLMA25Z9IZAa5UKGsKIEQAHs27JycnvWqgVsOfNr3sZnxX3L
	uNo+Qt9oprtl8mzlMmhAMaC0eUmAJxwX6X7FD8kD6uEgfZYo8axOZL2RF4RjAUkaSwfqTG3bsSSk6
	m5P0RGIWhwNIPKkF0D70MZr6CrVtpbMqdvBvfAyYKjaT9N3TgiOgAUdRyQwWaWPugONKkdzcHeM/z
	QREkZu/lj8Wdv28OacMKLC2+Yf6aomlf8sTtOx1LsNC3aE8yXqIfnbtf9lOxRN9eH5UW3LdqzJJzz
	/i1UcFJRS45rX1HST3nA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nr3aj-00Fi70-Cj; Tue, 17 May 2022 20:14:49 +0000
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nmR60-00DbBt-3b
 for linux-i3c@lists.infradead.org; Thu, 05 May 2022 02:20:01 +0000
Received: by mail-pf1-x429.google.com with SMTP id x52so2531666pfu.11
 for <linux-i3c@lists.infradead.org>; Wed, 04 May 2022 19:19:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Moay9sBk8rVdbaL64S3jDlKhD4QT9fJRTKr12K5jA4Q=;
 b=m2o/3KXUn3ZQ20LMuY5L26YynIH0bHNe0Fuf3ch/mnqdG+uF0EhIGNRoA94CF7hkkU
 DICEutWk4PRZI4AgQ8JvG5IkzCYvyR4tmrErX7caGBsnZUMCBejo6+xhAxENgPsaMHhK
 ueKhrdkcSY04Yv5M7PPd3D42BeiiPApWaVfUxe9vSaHQ3Dlg7JWpS2NEtItND9bzw1dP
 YGGxf0Y0M5Jnt/pw4tYfLUN47x1o/BiRsOEFtnthcKW/oQQvaxmZFnWlTr6XuhLZJFdZ
 1vufCkBVn6X7bcLuzA9meKQLomIuFG+ictp7pKua3eHxp+fyx3yYdGwkTfrlAX9SmSWO
 TW7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Moay9sBk8rVdbaL64S3jDlKhD4QT9fJRTKr12K5jA4Q=;
 b=WaoxmA1obA0zudlz+ALpQlGcVDYadZpBPvZb9VsgVrbSmhEiNbphbXhl/ZiaR9U40a
 AW5jynYUhumI8muIAc+0xCctW1DZwk7vCuUn9/E3I8H7XygZ0ouylrLGp038XBvnbbsk
 LemAQfzAhZEJ4R9+YLSUGhcg++lemsuO0Qf2yDF+na8kljkwdTZ0EiR7wc6ywk6UdsNk
 yjTbTaoGez+HmCHkHzFiTlQCQfvZp9SYvF6TuSW/rq+aVGGKMGGL+taAuYlabh2MQrLw
 Xow4p8cyQbcuBxEDrV/4UJ+vevZbXQn616a0Tvm3ozEs4Bo5vqvB+0+jGdPrGSoCeDNX
 OmdA==
X-Gm-Message-State: AOAM533Z+oUtZqG7ahMP8dbPPiW78JFcJIJlR+pR6eaKLtxki44SRjVG
 KnplIVHcFSa9RKzvo4xBb2E=
X-Google-Smtp-Source: ABdhPJze9fMC3XNJanQ45X3LhX0fh8loKWHwpc0KslufZ+Vjs8bB8YGm37Bc3hMJTtbcubwSHdG/sQ==
X-Received: by 2002:a05:6a00:1353:b0:50e:982:6a4f with SMTP id
 k19-20020a056a00135300b0050e09826a4fmr11808215pfu.50.1651717198174; 
 Wed, 04 May 2022 19:19:58 -0700 (PDT)
Received: from localhost.localdomain ([193.203.214.57])
 by smtp.gmail.com with ESMTPSA id
 e185-20020a621ec2000000b0050dc76281bdsm76984pfe.151.2022.05.04.19.19.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 May 2022 19:19:57 -0700 (PDT)
From: cgel.zte@gmail.com
X-Google-Original-From: chi.minghao@zte.com.cn
To: alexandre.belloni@bootlin.com
Cc: npitre@baylibre.com, linux-i3c@lists.infradead.org,
 linux-kernel@vger.kernel.org, Minghao Chi <chi.minghao@zte.com.cn>,
 Zeal Robot <zealci@zte.com.cn>
Subject: [PATCH] i3c/master: simplify the return expression of i3c_hci_remove()
Date: Thu,  5 May 2022 02:19:54 +0000
Message-Id: <20220505021954.54524-1-chi.minghao@zte.com.cn>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220504_192000_208827_13220DBB 
X-CRM114-Status: GOOD (  10.09  )
X-Mailman-Approved-At: Tue, 17 May 2022 13:14:47 -0700
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

From: Minghao Chi <chi.minghao@zte.com.cn>

Simplify the return expression.

Reported-by: Zeal Robot <zealci@zte.com.cn>
Signed-off-by: Minghao Chi <chi.minghao@zte.com.cn>
---
 drivers/i3c/master/mipi-i3c-hci/core.c | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/drivers/i3c/master/mipi-i3c-hci/core.c b/drivers/i3c/master/mipi-i3c-hci/core.c
index 8c01123dc4ed..6aef5ce43cc1 100644
--- a/drivers/i3c/master/mipi-i3c-hci/core.c
+++ b/drivers/i3c/master/mipi-i3c-hci/core.c
@@ -768,13 +768,8 @@ static int i3c_hci_probe(struct platform_device *pdev)
 static int i3c_hci_remove(struct platform_device *pdev)
 {
 	struct i3c_hci *hci = platform_get_drvdata(pdev);
-	int ret;
 
-	ret = i3c_master_unregister(&hci->master);
-	if (ret)
-		return ret;
-
-	return 0;
+	return i3c_master_unregister(&hci->master);
 }
 
 static const __maybe_unused struct of_device_id i3c_hci_of_match[] = {
-- 
2.25.1



-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
