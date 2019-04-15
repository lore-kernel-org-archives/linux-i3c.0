Return-Path: <SRS0=s+0C=SS=lists.infradead.org=linux-i3c-bounces+linux-i3c=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 49B5CC282DC
	for <linux-i3c@archiver.kernel.org>; Tue, 16 Apr 2019 11:12:28 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1831C20857
	for <linux-i3c@archiver.kernel.org>; Tue, 16 Apr 2019 11:12:28 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="LWRlDKgd";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="Y96GlD/F"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1831C20857
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=synopsys.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=IjOdWiwDK3bt3icdUTVr5EjqgfM+9Lck+OE0fiunz4o=; b=LWRlDKgdfNMP2KjCZgK4jevLeD
	Q810kKpCvkV4F07Q5M7yBMY3X6LNlTMZXD5G2LMVPtZcmGwK0l207Sstoa5gaNH17Z7pmtbUa15PJ
	hkUMB+Ue2ZoPfiyDcgI42SJ13rZeX+kRC1vbMYRWsELlc1XfP+p7J1wGlQQO40WybBgG+21EO5AKY
	JoZIlgH8kRhGw+cXNrWcVJXAGLzvbHGkQBaD6dcvXKDw5Cwf5quBhLIZqf1NaAzv1fIC3i8U4aiW9
	FMuOwUUTVfBhyoNfEABxghPhCRLEfj2Ht0C7kNlnmwsLQNKQXmaPgsEHf2do5LF/8GVHM5d2DpR8e
	s+T9P4cw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hGM0p-0001FG-KW; Tue, 16 Apr 2019 11:12:27 +0000
Received: from smtprelay.synopsys.com ([198.182.60.111])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hG79Y-0001Qu-9E
 for linux-i3c@lists.infradead.org; Mon, 15 Apr 2019 19:20:29 +0000
Received: from mailhost1.synopsys.com (mailhost1.synopsys.com [10.12.238.239])
 by smtprelay.synopsys.com (Postfix) with ESMTP id 2E75310C0B68;
 Mon, 15 Apr 2019 12:20:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1555356028; bh=PD9Bd2KLbPnyLJM4lKAMFHF/QND4G0ncjh4jLufAdsQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:In-Reply-To:
 References:From;
 b=Y96GlD/FJThumDKKCzLycHo6EZw2PPxmgEo6K/WRuNifc/MwfLwIAODGnl6L2DC/x
 ZKesFFTO1M127wT3eYVvCrrIuFwqHimTBzK0SCGjc9Xcx7SbzmVsfix8/mnzWcpELM
 Cqe1J04YvBJXRK2fH5s16Gadjsi8kHeIHEo7HImc1P3m6oMuyYwlpsHQp9hdJYaeOL
 77+/jj5nG5qVq2U/hgu2W2mee9ys3tejIXu5TMt27UGXd2rT9s8XMLQcXxXqmcHwJP
 nKjYRp0vbGeKqUTmav/rQER5HbFLfi8wMiBHhjTnEjg4PsYFN3H/ZLAxxDUdJJ39vi
 KVIuoZkdjGePg==
Received: from de02dwia024.internal.synopsys.com
 (de02dwia024.internal.synopsys.com [10.225.19.81])
 by mailhost1.synopsys.com (Postfix) with ESMTP id 57D3F546D;
 Mon, 15 Apr 2019 12:19:55 -0700 (PDT)
From: Vitor Soares <vitor.soares@synopsys.com>
To: linux-iio@vger.kernel.org, linux-i3c@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH 2/3] i3c: Add i3c_get_device_id helper
Date: Mon, 15 Apr 2019 21:19:40 +0200
Message-Id: <33ba7e13816fcece0a2f7ec917c18807359c16c7.1555354268.git.vitor.soares@synopsys.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1555354268.git.vitor.soares@synopsys.com>
References: <cover.1555354268.git.vitor.soares@synopsys.com>
In-Reply-To: <cover.1555354268.git.vitor.soares@synopsys.com>
References: <cover.1555354268.git.vitor.soares@synopsys.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190415_122028_323863_A150D26C 
X-CRM114-Status: UNSURE (   9.42  )
X-CRM114-Notice: Please train this message.
X-Mailman-Approved-At: Tue, 16 Apr 2019 04:12:27 -0700
X-BeenThere: linux-i3c@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: Linux I3C <linux-i3c.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-i3c>,
 <mailto:linux-i3c-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-i3c/>
List-Post: <mailto:linux-i3c@lists.infradead.org>
List-Help: <mailto:linux-i3c-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-i3c>,
 <mailto:linux-i3c-request@lists.infradead.org?subject=subscribe>
Cc: lars@metafoo.de, bbrezillon@kernel.org, gregkh@linuxfoundation.org,
 joao.pinto@synopsys.com, rafael@kernel.org,
 Vitor Soares <vitor.soares@synopsys.com>, broonie@kernel.org,
 pmeerw@pmeerw.net, knaack.h@gmx.de, lorenzo.bianconi83@gmail.com,
 jic23@kernel.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org

This helper return the i3c_device_id structure in order the client
have access to the driver data.

Signed-off-by: Vitor Soares <vitor.soares@synopsys.com>
---
 drivers/i3c/device.c       | 8 ++++++++
 include/linux/i3c/device.h | 1 +
 2 files changed, 9 insertions(+)

diff --git a/drivers/i3c/device.c b/drivers/i3c/device.c
index 472be99..8ab8e4c 100644
--- a/drivers/i3c/device.c
+++ b/drivers/i3c/device.c
@@ -235,6 +235,14 @@ struct i3c_device *dev_to_i3cdev(struct device *dev)
 }
 EXPORT_SYMBOL_GPL(dev_to_i3cdev);
 
+const struct i3c_device_id *i3c_get_device_id(struct i3c_device *i3cdev)
+{
+	const struct i3c_driver *i3cdrv = drv_to_i3cdrv(i3cdev->dev.driver);
+
+	return i3cdrv->id_table;
+}
+EXPORT_SYMBOL_GPL(i3c_get_device_id);
+
 /**
  * i3c_driver_register_with_owner() - register an I3C device driver
  *
diff --git a/include/linux/i3c/device.h b/include/linux/i3c/device.h
index 7ee7e30..ee48886 100644
--- a/include/linux/i3c/device.h
+++ b/include/linux/i3c/device.h
@@ -211,6 +211,7 @@ static inline struct i3c_driver *drv_to_i3cdrv(struct device_driver *drv)
 
 struct device *i3cdev_to_dev(struct i3c_device *i3cdev);
 struct i3c_device *dev_to_i3cdev(struct device *dev);
+const struct i3c_device_id *i3c_get_device_id(struct i3c_device *i3cdev);
 
 static inline void i3cdev_set_drvdata(struct i3c_device *i3cdev,
 				      void *data)
-- 
2.7.4


_______________________________________________
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
