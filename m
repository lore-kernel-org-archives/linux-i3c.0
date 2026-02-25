Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7847BEFD221
	for <linux-i3c@archiver.kernel.org>; Wed, 25 Feb 2026 09:38:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To
	:From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=zofVcYWE2gGGvIB2JnBLpu3OUnRdgaGKaZYaF1png84=; b=JYomxywFjshEw9
	YRSvmEgdMuE5YA0zL8/ELMcHt/BF6jDU737x36m0StB58T+X7QCZz+F8ZyOpBzB/p5NVYMIbU44N7
	gRNcGPojZIqX5yn7vI1Iq2XHSWET8nligv3kf1DNSVRCYcy7/SnvKGFPm8DhFaCCjgZh+qcI9d+EJ
	uq565tmoatgd/EE5Dobw7zCzuPEIIB4TS8adJX6k3dpqx9m3BH2AKWSBmrGg6H9L23yM4s4vG/Vyb
	2GaG/2h/4Hx0W5xNw7Y/kBlQ/UClFB5u6d6VJ8PwCtYiCoLBLFIlG1V+DaFWgX73ciQaSF7kEPbwb
	HR0osN2SpXPUGM9YA2zA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvBLH-00000003hmh-0zr1;
	Wed, 25 Feb 2026 09:38:03 +0000
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvBLE-00000003hlw-16RF
	for linux-i3c@lists.infradead.org;
	Wed, 25 Feb 2026 09:38:01 +0000
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-2ad9a9be502so11927405ad.0
        for <linux-i3c@lists.infradead.org>; Wed, 25 Feb 2026 01:38:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772012279; x=1772617079; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=VrJHjtIjpvQd2RLofJyYx5MFJvHaGuU631q0w7GgkD8=;
        b=iuJBi19JeopaVrSZer8SInjsZKWSReiRdNSVUk+JQQCEGkp1q4FsAk5B/1asAisfcm
         SQYK91kymNJixgSEw4GFERJcRNZ2NQAoSnYNGXEYO1g0cRdqpBDgINfcA6Bhqos+SHrY
         vb6JJo2bmFvqs/hg5nlzPUNBxioJXZ3Ww/1b3zbZF8xXh+NTlTDN6vXvplNYdT+B/xyr
         e6BrW4tVvLqpjQLQBDGzcyqOIth61brTdDC+a/YHDHkSY4UMhCggxjAtJE3Zt7YmCq10
         KYfeCDWJus3+DfyUPXDT/Uuk3624sKanHKIv4rqOcK+lAaXWSmayxeTz2WCe9xJb+LX4
         SM3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772012279; x=1772617079;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VrJHjtIjpvQd2RLofJyYx5MFJvHaGuU631q0w7GgkD8=;
        b=cMY+NMdi5qJIdX0mKJixFbl30bRWP9eUranrsweOXhWUniGaw4B6lGot8bZ+ijVNMS
         rB7uoWHSIFOE41ayA8mLhNAcQO8pXDppizxeyQjO+Mu6v5X9+BSsyHLEVslt32t0+zzZ
         Q6pHc8SCRFwJuHzbhWOkW53AGqaPcbz4BKWgL4wJcH938mymLWj6kDmjP0XYwMQq7cQX
         GpC5WQ+1J2C02GMHYhg66X9XeXE2/PARlS64qynZo5mIPlCohQnbcJJHsitwc7iDFmy2
         CdH46XQnJOVypiqfPA1+kuNB+551QPi4QCfxPmjxqemEac1p6lz+Mghc3JSzutXJShUN
         4IIA==
X-Forwarded-Encrypted: i=1; AJvYcCVudHgUxkKBMlT5iGIEJ2IOlUIUqNsk3XNvMfk/xJ9gOF1Oa/obY5GuktSTFiikD4hBUBiGzMXiUNo=@lists.infradead.org
X-Gm-Message-State: AOJu0YxxO6Mte5J4/CNZpVKvO8aL1TgI5TST/uCGguw6fRATau4FByx7
	BDZlDm1hQ0zCQn45ncScMnhni9SGhXD6kgeVP6uFuqKvSA7Os+T4F9dL
X-Gm-Gg: ATEYQzwjb9AaGtDbBvKC19yXa7lnmC0fr1UZJxrMKBjCffB2aHmhL83FuuA7o78bJVD
	jQJBsseqPQjwWWwNDrjhRnHXY1HL+YkBqljSQ49Rc/w6XjE1h0Ve49VcqmdmmOIhaTjG571tLCk
	2huIPDdzSBD4eheKz94RF03HJlCSKUPu4TOGzryrwIdasUeTjlkljnGCL5E2KF6E8JGKparfwix
	O2mRYwgTRcDUvUcMoZJQsSIXd7Htop0yPFlCy6Y7LnJ/D+4Z+B5APpS7jHR1u2vXimZiduwQcz5
	INgJ5ScyO/JSvWqUf35wpiyFx8Z8xvR3mL8ByZilGbmVzeeOXlVJM5d0W1orKbJFilJzS9xZoqA
	sbqRSFbpUb7O8twNtHFtQQtxf2v/Wohp0F/YaGqJa4GozgRUc+/nj85SbU+FWv8lfmE6xL0CmJF
	Pt17WstzTkzX7VL2VoS8aon3ilh4TCin9epTJz9Kloa60V2zNLe6za3Q77grdxHyo3GQ==
X-Received: by 2002:a17:903:1b64:b0:2ad:cede:3a18 with SMTP id d9443c01a7336-2add13fdd52mr20019715ad.33.1772012279426;
        Wed, 25 Feb 2026 01:37:59 -0800 (PST)
Received: from eric-N-A.. (61-220-246-151.hinet-ip.hinet.net. [61.220.246.151])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ad750586e3sm136888255ad.90.2026.02.25.01.37.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Feb 2026 01:37:59 -0800 (PST)
From: Peter Yin <peteryin.openbmc@gmail.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Frank Li <Frank.Li@nxp.com>,
	Adrian Ng Ho Yin <adrianhoyin.ng@altera.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Manikanta Guntupalli <manikanta.guntupalli@amd.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Jorge Marques <jorge.marques@analog.com>,
	linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] i3c: master: dw-i3c: Fix missing of_node for virtual I2C adapter
Date: Wed, 25 Feb 2026 17:37:52 +0800
Message-ID: <20260225093755.3696236-1-peteryin.openbmc@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260225_013800_304883_27DF3542 
X-CRM114-Status: UNSURE (   9.54  )
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

The DesignWare I3C master driver creates a virtual I2C adapter to
provide backward compatibility with I2C devices. However, the current
implementation does not associate this virtual adapter with any
Device Tree node.

Propagate the of_node from the I3C master platform device to the
virtual I2C adapter's device structure. This ensures that standard
I2C aliases are correctly resolved and bus numbering remains consistent.

Signed-off-by: Peter Yin <peteryin.openbmc@gmail.com>
---

Changes in v2:
- Move the fix from the ast2600-specific driver to the dw-i3c common

 drivers/i3c/master/dw-i3c-master.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/i3c/master/dw-i3c-master.c b/drivers/i3c/master/dw-i3c-master.c
index d87bde3f7700..adf618d131dc 100644
--- a/drivers/i3c/master/dw-i3c-master.c
+++ b/drivers/i3c/master/dw-i3c-master.c
@@ -1659,6 +1659,8 @@ int dw_i3c_common_probe(struct dw_i3c_master *master,
 		pm_runtime_get_noresume(&pdev->dev);

 	INIT_WORK(&master->hj_work, dw_i3c_hj_work);
+
+	master->base.i2c.dev.of_node = pdev->dev.of_node;
 	ret = i3c_master_register(&master->base, &pdev->dev,
 				  &dw_mipi_i3c_ops, false);
 	if (ret)
--
2.43.0


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
