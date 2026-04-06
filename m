Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5056BEF4EDF
	for <linux-i3c@archiver.kernel.org>; Mon,  6 Apr 2026 12:43:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FBjPHqiesdW2Uy4xMTSMQ+lV6e4/IGHFQuFVolz+OjQ=; b=yFrmjdGCzBuVvk
	Qts3Xw4zeDSC6hJvKFpup+tpb/q0gDHi6FvbKNczleCfSLfPuTSN1hU6X9ZzQDK8IbWZgxxJmzBGk
	HargPppL68i2L5zQipI3kf3yRvKWTEmPuENUZf7mcZBtOKsXzpWww4lP9NQz2x1gxw75iYy2sXFbD
	8H5BHq37blrZogDalwLNtQbgNk/01BroeysjPUNyGKOc1pKCXuQyi3H9Ei+Qijw7CcieTt7Fkkxq4
	feZcmSs8nzGvZqiUnvF0Zjzt/+CImPUl4FyU64diu+nABdAq7MDK6KpdvbL0ltjBgwzfMl9MZN2Ck
	2NLEUu3esUkwWsjH4XyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w9jIe-000000057O5-2kUX;
	Mon, 06 Apr 2026 12:43:28 +0000
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w9jIc-000000057N1-3MUS
	for linux-i3c@lists.infradead.org;
	Mon, 06 Apr 2026 12:43:27 +0000
Received: by mail-pj1-x1035.google.com with SMTP id 98e67ed59e1d1-358ed696623so1613282a91.0
        for <linux-i3c@lists.infradead.org>; Mon, 06 Apr 2026 05:43:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775479406; x=1776084206; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wjcK3tok28m2bJBEH/yACHT3hrJYzSFXx2J9XfeqLgU=;
        b=FBbkw2rC7ZSG7nQRCVHxdTko9g/wg9ps8WUiRmQcsQo3pLk1od94uIwNSCDlfjekDw
         GRHVm5YWS9GBK8yAlce27qBmt8JjL2MrK/paQM1aWJlk7w0PLy5+4iQCkgbvLukdtFad
         zyvjxyQcjd+hwHARezQKooWvpfHy8QYxtezrAfXTvWxF6+sM2eomqN+NBXrk8wqV8WGB
         5mbuNzQgkD8mZ/zIwiAg2kuJvTWF8w7OQtxNAbPHj8aPcsZJ+RtR/9site4WIlRdx+RD
         Taq336HS239BRC5BOHQv5y9SpqQC995gvFwDeoXbyRoHxoDjTFis1+wyktIJLw9/qdGF
         G+XQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775479406; x=1776084206;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=wjcK3tok28m2bJBEH/yACHT3hrJYzSFXx2J9XfeqLgU=;
        b=ZNAD+2wADvI7WIPtnm3nTEIm37DFTAeLDaz/O0SvGYeo2VDISbX1GhuvVmmP6aacFe
         +JCh+l4NTrCZmc7s2vYq0oQfLFLavuy6Hs51fJS9Iu+GBqfVyuSa/uvZw5y//s9NwJJi
         LHrcLWG5/cGREnwyirGHyLR+zHjmQ4Ey6aSMqZODIgyDVgWOXiYeo4M4LLYKgT3Dp3yf
         mZnBT2SMkJeGt9atPHhYT3KwTrH++b6Mf9h8iFKS9n9bRVz+XSJR57gfhBr7NwF9j/D1
         iMyfWWAzbJDlHPCJnF1Nn5vYSLS90oit6mM6ty/Hy405gFsKp6hAatH20GeiG2n9PH8R
         UrQw==
X-Gm-Message-State: AOJu0YxSYbfeoPKUEy2j+arz/rFIj/vhSwWRgEeNIRflN5mvFuzkQq2B
	Amz4L4pTxmKb0eHnegY5xfic55VPV3e2KxE3Zwu8w2QwdgUQLSnGb9lG
X-Gm-Gg: AeBDietGEs9rxu330wuCjpPUxoOdDSugvvwOGOQl8osje0mO4u1h/A8Xj13+HPbpyCE
	y7g8WJBD0u10VFKhmdqit+HA+U8ZNmbQTqFyPaoAz4rEP7K9Q3gILVWKnkOFRVFcyE6FtlOd7+a
	zHoFyueICPBXe9prFTi0mCnmEZXOUtVt6Qg46w0nJltNTAP5BYoRMQwz1echKLOzfEmOR+tkWRv
	hdt2Oxm4vwqBAWyUUhwxWNo10A65UKGpEybVnbyCmVTx67L5qa+CwoM/timm3WvNCIn6wRVxbTw
	QjRV+ImN+9d/rTVPT1wWxXoGl1v5C6nTC+aVb+P0hqxGW3UouWao9G3n9YztwzcXR6e9fSvSfM5
	HQg93X7y/RwwJfDiGPkD6118k1jYeCTuM80snQjSktmhe/soGlvmIkqDaNie517BWFXB+u83EKi
	YHCUO5N2JrgpIA0Cfqtx1LGROz1gJZA2Eg2AsrO9DsHBZQ+zhtKZnHBkDUrd20caD/wRrkpSt78
	ae1ARtLEdJsSROfJ05o
X-Received: by 2002:a17:903:183:b0:2b0:5626:f75d with SMTP id d9443c01a7336-2b28176974bmr130993675ad.26.1775479405816;
        Mon, 06 Apr 2026 05:43:25 -0700 (PDT)
Received: from junjungu-PC.localdomain ([223.167.147.240])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b27472d233sm143486445ad.2.2026.04.06.05.43.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Apr 2026 05:43:25 -0700 (PDT)
From: Felix Gu <ustc.gu@gmail.com>
Date: Mon, 06 Apr 2026 20:43:17 +0800
Subject: [PATCH v3 2/2] i3c: master: renesas: Use __free(kfree) for xfer
 cleanup in renesas_i3c_send_ccc_cmd()
MIME-Version: 1.0
Message-Id: <20260406-renesas-v3-2-4b724d7708f4@gmail.com>
References: <20260406-renesas-v3-0-4b724d7708f4@gmail.com>
In-Reply-To: <20260406-renesas-v3-0-4b724d7708f4@gmail.com>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>, 
 Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Frank Li <Frank.Li@nxp.com>
Cc: linux-i3c@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Felix Gu <ustc.gu@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1775479398; l=1195;
 i=ustc.gu@gmail.com; h=from:subject:message-id;
 bh=xlUiC/j9yL5DybNZPhI4F6kC9c2SBjQyoCIdTqYj+Yg=;
 b=4mpEaLtzU5fuoaAdSlCDh9tV03c23tMf8tpROpBTELIv8MNZjrNnK4ECmDbU/F3z7WLn+4lbn
 o0WBeGrI99eChlauQTQJtkT6ha+JaKiprX+FKbm6THhWYapYSMCZRsf
X-Developer-Key: i=ustc.gu@gmail.com; a=ed25519;
 pk=fjUXwmjchVN7Ja6KGP55IXOzFeCl9edaHoQIEUA+/hw=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260406_054326_849236_9E79839E 
X-CRM114-Status: GOOD (  10.25  )
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

Use __free(kfree) for automatic cleanup, matching the pattern already
used in other functions in this driver.

Signed-off-by: Felix Gu <ustc.gu@gmail.com>
---
 drivers/i3c/master/renesas-i3c.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/i3c/master/renesas-i3c.c b/drivers/i3c/master/renesas-i3c.c
index a8a9e89a9710..f39c449922ca 100644
--- a/drivers/i3c/master/renesas-i3c.c
+++ b/drivers/i3c/master/renesas-i3c.c
@@ -748,7 +748,6 @@ static int renesas_i3c_send_ccc_cmd(struct i3c_master_controller *m,
 					   struct i3c_ccc_cmd *ccc)
 {
 	struct renesas_i3c *i3c = to_renesas_i3c(m);
-	struct renesas_i3c_xfer *xfer;
 	struct renesas_i3c_cmd *cmd;
 	int ret, pos = 0;
 
@@ -758,7 +757,7 @@ static int renesas_i3c_send_ccc_cmd(struct i3c_master_controller *m,
 			return pos;
 	}
 
-	xfer = renesas_i3c_alloc_xfer(i3c, 1);
+	struct renesas_i3c_xfer *xfer __free(kfree) = renesas_i3c_alloc_xfer(i3c, 1);
 	if (!xfer)
 		return -ENOMEM;
 
@@ -807,8 +806,6 @@ static int renesas_i3c_send_ccc_cmd(struct i3c_master_controller *m,
 	if (ret)
 		ccc->err = I3C_ERROR_M2;
 
-	kfree(xfer);
-
 	return ret;
 }
 

-- 
2.43.0


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
