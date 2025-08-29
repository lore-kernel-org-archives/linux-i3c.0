Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57EA0CA0FFD
	for <linux-i3c@archiver.kernel.org>; Fri, 29 Aug 2025 03:39:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HdO6rNsbPw5kOzLp0ZD3AMORyCIePwV2I1ZVfGDoKtY=; b=3dTqBIq+p4GRHV
	1XXW85SDXM9LdNubAcLvAVs0sZkD8l78SdTM4OlyantruM0nC49ta794FWoK+R6BlOK3VRvjHQlZ6
	xyxlSfVkuNuSRDAM4LmQ0qtY/GWISXnBktyMVvYf7n+ZFzlk7UtIH/dXzIBwm3N5rUbQyVV9iYSXR
	T8vh+RhTWZ9xQ/qi4pdi09W+y54MN2aiZFiSZEfBDK0psnr2cyqVNgUkSd6Vu3jIEtJ7SjZbAnSac
	BTw1cCgVcqiXF1aar8D8sPdR385WOVRbWH7LszuYNI9MW6f3RbPLaZU+ja9YFTfcctXHF8QQpWL/t
	1qlTOJpTwwtmhM08xq7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urpxJ-00000004F6K-0QBk;
	Fri, 29 Aug 2025 03:39:13 +0000
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urnpo-000000040Nj-2MBx
	for linux-i3c@lists.infradead.org;
	Fri, 29 Aug 2025 01:23:21 +0000
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-2489acda3bbso12459995ad.1
        for <linux-i3c@lists.infradead.org>; Thu, 28 Aug 2025 18:23:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756430599; x=1757035399; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+oHGtvYtsesmIt3+EM6g35UIqNVWRbi1ozOFONogT1I=;
        b=JghRNm7Zd7IZTsfx6UmxLJhjKQv5rMFfHx7q2YKF92Sn8uRzb36ebTTP1fzYvaBRCt
         OAiyf3VEaulOdTUeUsZJSYqjLtbse5KSn9C1mEi59NElEnibn/pYK9qUonbfS1/cFvpR
         rAl4A15HdJSxJ5UucTUJC25qARHSePqMxWm4WCZIKuXfw/WfnrkQn08N9TRqcdAolXOZ
         2eAB64BN1SUTGTFMLSGPkLtW65EtJpCyjwbg2T+ZnCs6i5QYIm0qCP7TTzNV+zEyXZpR
         SlQLXftYEc64OCAt52Fui5jLCc3d3p1O7jGdf6f6fxQpr+ZSoxNVPP8X00ddGXHxehrL
         mOXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756430599; x=1757035399;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+oHGtvYtsesmIt3+EM6g35UIqNVWRbi1ozOFONogT1I=;
        b=PTvuXukcRaAook3vm51IWlsnEDTkWWICcZ4G1aNmNyJfHnVQb3oLhttV2wa4fxnioB
         7DUQWiiv+j4+v5H5PnG11zFZN4n++MDAAILAQZQItvDca4bamPKWEbbUFi9eb5N2HY38
         YUkza7ob8wpk8jPAbw25GxI3o67H0aG9YThGOrz823Rv7bQJEUZh0c5XaOrTKVI5LQkS
         LkLxw6DG2MEaQhrwiUm/SsJuQMyz0DllyCu+Qdq0OhuP2t0PjtnRkUTfXqbC4+G5BtIR
         lkSizlc8Oy5x6R6m7WcKxHFoxlQjgpKZ2waedLSChd3YRHBIvMCkeEGBidZi7+j64pdi
         L7XQ==
X-Forwarded-Encrypted: i=1; AJvYcCWDqCplP5Woz95zvQsYnU18q8q56BA+3W2df8/xS1hHaFw+fz62JQQ6UvhEIqIi/zuncZ+m1uiz1QE=@lists.infradead.org
X-Gm-Message-State: AOJu0YyFeT3iKXX/juHoz0kppxgEXrLDTSfmkIAD+XY1Kkpt5MQqNAN0
	RSeIucY9ctlXBm9lJWb60LCS5gpeHp2SK9iCL4HY2DfVrPmeItfDBGo68dgIOQ==
X-Gm-Gg: ASbGncuDPDXF8tLuvLGSrWFag8n7aKJ+eZahc/T9FTEZx3RCPSDihYMIkjAx9Lf9Es3
	SY7azyaBuLMly/74l2L7lymovF/Aj6414FEQ1cJq68TjdhccmjrKWkZX/X8TtF+4m3RRvFsb4Qv
	nRfwBllxUY/rlrwCnpVZ2YmPuDHVFaZhNDUC9nhyihyedzdCjdZB5R7QeZ5EgMuaa0fgGItQmj4
	injtS7t5xuizj0gN+EM0om+UjjF9+4VxkV4tBUDdahDxuOVTGtpXYmGLU1TcfKJWhSiNKiIyTyc
	xV/mCm3P6Sd+U1SszHv8Wz57wU6+QxcS0XjS9kNL94t+ZvthfmMpMMLDX6GArU2WnAiIsjiP8wb
	mrht+1C6A/Is7O6e4DgNw6dR0Ebv0+3uB
X-Google-Smtp-Source: AGHT+IG+t3nrXLoxxR1n0FoxZdNMEKufEOVKLubzBN2CKS3LXLlRkY/AYqSJD7YLsftqx+TsO0/egA==
X-Received: by 2002:a17:903:2406:b0:248:8872:5889 with SMTP id d9443c01a7336-24888725c49mr148909745ad.38.1756430599488;
        Thu, 28 Aug 2025 18:23:19 -0700 (PDT)
Received: from cs20-buildserver.lan ([2402:7500:500:7a9f:2e0:4cff:fe68:863])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-24905da183asm7686885ad.74.2025.08.28.18.23.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Aug 2025 18:23:19 -0700 (PDT)
From: Stanley Chu <stanley.chuys@gmail.com>
X-Google-Original-From: Stanley Chu <yschu@nuvoton.com>
To: frank.li@nxp.com,
	miquel.raynal@bootlin.com,
	alexandre.belloni@bootlin.com,
	linux-i3c@lists.infradead.org
Cc: linux-kernel@vger.kernel.org,
	tomer.maimon@nuvoton.com,
	kwliu@nuvoton.com,
	yschu@nuvoton.com
Subject: [PATCH v2 2/2] i3c: master: svc: Recycle unused IBI slot
Date: Fri, 29 Aug 2025 09:23:09 +0800
Message-Id: <20250829012309.3562585-3-yschu@nuvoton.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250829012309.3562585-1-yschu@nuvoton.com>
References: <20250829012309.3562585-1-yschu@nuvoton.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250828_182320_607847_301D7345 
X-CRM114-Status: UNSURE (   8.68  )
X-CRM114-Notice: Please train this message.
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

In svc_i3c_master_handle_ibi(), an IBI slot is fetched from the pool
to store the IBI payload. However, when an error condition is encountered,
the function returns without recycling the IBI slot, resulting in an IBI
slot leak.

Fixes: c85e209b799f ("i3c: master: svc: fix ibi may not return mandatory data byte")
Signed-off-by: Stanley Chu <yschu@nuvoton.com>
---
Changes since v1:
 * Add Fixes tag
---
 drivers/i3c/master/svc-i3c-master.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/i3c/master/svc-i3c-master.c b/drivers/i3c/master/svc-i3c-master.c
index 8e7b4ab919e3..9641e66a4e5f 100644
--- a/drivers/i3c/master/svc-i3c-master.c
+++ b/drivers/i3c/master/svc-i3c-master.c
@@ -417,6 +417,7 @@ static int svc_i3c_master_handle_ibi(struct svc_i3c_master *master,
 						SVC_I3C_MSTATUS_COMPLETE(val), 0, 1000);
 	if (ret) {
 		dev_err(master->dev, "Timeout when polling for COMPLETE\n");
+		i3c_generic_ibi_recycle_slot(data->ibi_pool, slot);
 		return ret;
 	}
 
-- 
2.34.1


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
