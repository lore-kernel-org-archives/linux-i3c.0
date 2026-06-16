Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10B6ECD98E8
	for <linux-i3c@archiver.kernel.org>; Tue, 16 Jun 2026 11:38:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fspspFZa4A+kBh3GDRMRyb9wRnebnEDzC1EeLhDmIo4=; b=iOfvTrV45VQMCX
	TogaPH64guxpYSnmSgU46wF0s++q7wd7N9LNN5B0FDR/ggXKYDLTsnwC+yAuISwNLNqRJdeSOgD7v
	inbWPxSyDzlByHYfro6pA8NqEldJC+1gDlXjGdiKNCJh4kPaHLx8flpLm4+8N1vgsR6SCqgeZsuef
	AxA0Vi52GLTJ+W0IRgM/IbPyj88yIZRfEzEy43rVdTvB9oF9dri1yo1UuTjKq14I7j954UDN4Gees
	O5vv5SHiyjt49pfM/q+KaMCrzP6/nZoe+pEDl7N6GETwn2jlTPcUWIvX5jS89UTYE1CJrVguXN/bG
	NDt4qXGH5kZ/wRI5VKaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZS7P-0000000FgTq-3PiO;
	Tue, 16 Jun 2026 11:38:11 +0000
Received: from mgamail.intel.com ([198.175.65.17])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZS7N-0000000FgSd-1J4g
	for linux-i3c@lists.infradead.org;
	Tue, 16 Jun 2026 11:38:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781609889; x=1813145889;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=jQv/ThlKjqGZZhnQNN9SDpBuZM0obGbAGQDEWX6hUJ0=;
  b=BXXooh7KEeLDJ0cdnyOfCF6F/MzKupETiJaYqmbd5O9vZRncy+VXtN76
   52KzFAMR1VBHvLzEDWJRCWQdLxBYBQpi3CLfhBfvfWvZ6+pMXmHBNvbR/
   qwcg3rJtganfzk4mgNs1fjNZfwmlwsqBefQ/NCZctXT45IYAKFuhFZQGy
   c6v9f7ogzJ/UB6rBbxNGHTYTxkE51A+1O9hOs6P1s44qRLLplc6PWOw1U
   /DlRvNeIU1mGFhEgVqbmkVMdUwaVqoCJiRdMOnqYZUgQIBL3pJ+UKECYT
   kyLE7w3gohUMvifUTccumbtAT8U4fcj1hQkj/+dPkWQxSiOpn7RFcZSLl
   g==;
X-CSE-ConnectionGUID: Pi6X82Z+Q3qtbDLRGD8V0w==
X-CSE-MsgGUID: F+ElDdRaRZaDMvfHLu9SPw==
X-IronPort-AV: E=McAfee;i="6800,10657,11818"; a="82383822"
X-IronPort-AV: E=Sophos;i="6.24,208,1774335600"; 
   d="scan'208";a="82383822"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jun 2026 04:38:09 -0700
X-CSE-ConnectionGUID: BMgErz81S3mEkAfFAet+Fg==
X-CSE-MsgGUID: pFQx3lOURqeqv+a+yKiAjQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,208,1774335600"; 
   d="scan'208";a="251666738"
Received: from abityuts-desk.ger.corp.intel.com (HELO ahunter6-desk) ([10.245.244.134])
  by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jun 2026 04:38:07 -0700
From: Adrian Hunter <adrian.hunter@intel.com>
To: alexandre.belloni@bootlin.com
Cc: Frank.Li@nxp.com,
	Adrian Ng Ho Yin <adrian.ho.yin.ng@altera.com>,
	linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 3/3] i3c: master: Use unsigned int for dev_nack_retry_count consistently
Date: Tue, 16 Jun 2026 14:37:52 +0300
Message-ID: <20260616113752.196140-4-adrian.hunter@intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260616113752.196140-1-adrian.hunter@intel.com>
References: <20260616113752.196140-1-adrian.hunter@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy, Registered Address: c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo, Business Identity Code: 0357606 - 4, Domiciled in Helsinki
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260616_043809_403498_D33FAD69 
X-CRM114-Status: GOOD (  12.54  )
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

Use unsigned int for dev_nack_retry_count across the core and
controller drivers to match the type of master->dev_nack_retry_count.

Update the sysfs store path to use kstrtouint() and adjust the
 ->set_dev_nack_retry() callback prototype and callers accordingly.

Signed-off-by: Adrian Hunter <adrian.hunter@intel.com>
---
 drivers/i3c/master.c               | 4 ++--
 drivers/i3c/master/dw-i3c-master.c | 4 ++--
 include/linux/i3c/master.h         | 2 +-
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/i3c/master.c b/drivers/i3c/master.c
index 903ac01ab413..58d20624ed05 100644
--- a/drivers/i3c/master.c
+++ b/drivers/i3c/master.c
@@ -760,10 +760,10 @@ static ssize_t dev_nack_retry_count_store(struct device *dev,
 {
 	struct i3c_bus *i3cbus = dev_to_i3cbus(dev);
 	struct i3c_master_controller *master = dev_to_i3cmaster(dev);
-	unsigned long val;
+	unsigned int val;
 	int ret;
 
-	ret = kstrtoul(buf, 0, &val);
+	ret = kstrtouint(buf, 0, &val);
 	if (ret)
 		return ret;
 
diff --git a/drivers/i3c/master/dw-i3c-master.c b/drivers/i3c/master/dw-i3c-master.c
index c7030d0cd8a6..e4f6d6f29ed5 100644
--- a/drivers/i3c/master/dw-i3c-master.c
+++ b/drivers/i3c/master/dw-i3c-master.c
@@ -1481,7 +1481,7 @@ static irqreturn_t dw_i3c_master_irq_handler(int irq, void *dev_id)
 }
 
 static int dw_i3c_master_set_dev_nack_retry(struct i3c_master_controller *m,
-					    unsigned long dev_nack_retry_cnt)
+					    unsigned int dev_nack_retry_cnt)
 {
 	struct dw_i3c_master *master = to_dw_i3c_master(m);
 	u32 reg;
@@ -1489,7 +1489,7 @@ static int dw_i3c_master_set_dev_nack_retry(struct i3c_master_controller *m,
 
 	if (dev_nack_retry_cnt > DW_I3C_DEV_NACK_RETRY_CNT_MAX) {
 		dev_err(&master->base.dev,
-			"Value %ld exceeds maximum %d\n",
+			"Value %u exceeds maximum %d\n",
 			dev_nack_retry_cnt, DW_I3C_DEV_NACK_RETRY_CNT_MAX);
 		return -ERANGE;
 	}
diff --git a/include/linux/i3c/master.h b/include/linux/i3c/master.h
index f73cede87d36..6f0379bdbb6d 100644
--- a/include/linux/i3c/master.h
+++ b/include/linux/i3c/master.h
@@ -494,7 +494,7 @@ struct i3c_master_controller_ops {
 	int (*disable_hotjoin)(struct i3c_master_controller *master);
 	int (*set_speed)(struct i3c_master_controller *master, enum i3c_open_drain_speed speed);
 	int (*set_dev_nack_retry)(struct i3c_master_controller *master,
-				  unsigned long dev_nack_retry_cnt);
+				  unsigned int dev_nack_retry_cnt);
 };
 
 /**
-- 
2.51.0


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
