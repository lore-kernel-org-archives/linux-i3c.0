Return-Path: <SRS0=tlLU=VQ=lists.infradead.org=linux-i3c-bounces+linux-i3c=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1C48CC76196
	for <linux-i3c@archiver.kernel.org>; Fri, 19 Jul 2019 13:31:08 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E77EC2184E
	for <linux-i3c@archiver.kernel.org>; Fri, 19 Jul 2019 13:31:07 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="U/I5fqim";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="gBNVRQG3"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E77EC2184E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=synopsys.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=sv5MH23sYCL/BPN0Q5XdxXBPj94BFNiEMgiwF17vDrk=; b=U/I5fqim+zFWO2yyh0+88qXZ5L
	eQ6EwoBid+BC1XqIVIU7XYutcilR2PR6u4aDww6lCpS4RLnZHE5/QJZYcvwUJ6v+Ukt5CS5QQOrSy
	DrRlQhgS+pu/Isw2LVxX5u3ny84J0ng9JYyP7VrAdHJc3E+zjKQPZK58H5sqb/P2xCC4m2NPpaa7q
	pBTyhSJMrVYTfNU3GWTlPwnEmsvJplzoJcud5pfkpuFNH8zNGCYYghlTcKFVgnE22gRE3+yS+wGX5
	odq4Od5RFIfA3PKrMKu4k4WR5hrmCAWe7s30X3l8wKl/9CJbXNsard6arWeq17VuzVQE5e0ubka9o
	M5WPQT/A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hoSyZ-00047w-Gh; Fri, 19 Jul 2019 13:31:07 +0000
Received: from dc8-smtprelay2.synopsys.com ([198.182.47.102]
 helo=smtprelay-out1.synopsys.com)
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hoSyV-00045m-7A
 for linux-i3c@lists.infradead.org; Fri, 19 Jul 2019 13:31:06 +0000
Received: from mailhost.synopsys.com (mdc-mailhost1.synopsys.com
 [10.225.0.209])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 6FAEBC1C32;
 Fri, 19 Jul 2019 13:30:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1563543059; bh=guLzfTDm0DCrYL34tliMIlpOGpkWKVhqKlozyTjq22U=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:In-Reply-To:
 References:From;
 b=gBNVRQG3fcgBpP9c+ZTPkHfktcuLn/rIeT9QocKk8tg9L3pMAXKnWzjeKqwXieytv
 CVuhcnFzn2RLqLL32/iLCfWPobtbP8a2mQ+NiJyxuNKAgZtTeoKWLQpudFkQttRyi4
 zwnNRr392g61iEbQKHr7R8S9BryUZrIE9EIftI456GCfhsrqISQzgl57r/glyRUWWp
 YOyeoYNKmSQul4uGkSq/1uChzbb4PIe9btAHa+brE/b7REsbUIVcMSr3HX7/WA7ZnW
 3/fnFwiXGsyQPHc293dcxUlIjZPv6pQanpHANEX7UnZdAvJ+wFv89JwAobzNHlQJT6
 NYOyKkuLK+qqg==
Received: from de02.synopsys.com (germany.internal.synopsys.com [10.225.17.21])
 by mailhost.synopsys.com (Postfix) with ESMTP id 45915A0057;
 Fri, 19 Jul 2019 13:30:57 +0000 (UTC)
Received: from de02dwia024.internal.synopsys.com
 (de02dwia024.internal.synopsys.com [10.225.19.81])
 by de02.synopsys.com (Postfix) with ESMTP id E7DF53EBC6;
 Fri, 19 Jul 2019 15:30:56 +0200 (CEST)
From: Vitor Soares <Vitor.Soares@synopsys.com>
To: linux-iio@vger.kernel.org, linux-i3c@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v6 1/2] i3c: move i3c_device_match_id to device.c and export it
Date: Fri, 19 Jul 2019 15:30:54 +0200
Message-Id: <2f94d66bab7e1d47f7eae8cde8028fd37fa4c423.1563542515.git.vitor.soares@synopsys.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1563542515.git.vitor.soares@synopsys.com>
References: <cover.1563542515.git.vitor.soares@synopsys.com>
In-Reply-To: <cover.1563542515.git.vitor.soares@synopsys.com>
References: <cover.1563542515.git.vitor.soares@synopsys.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190719_063103_284289_B10EA197 
X-CRM114-Status: GOOD (  15.62  )
X-BeenThere: linux-i3c@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux I3C <linux-i3c.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-i3c>,
 <mailto:linux-i3c-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-i3c/>
List-Post: <mailto:linux-i3c@lists.infradead.org>
List-Help: <mailto:linux-i3c-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-i3c>,
 <mailto:linux-i3c-request@lists.infradead.org?subject=subscribe>
Cc: Joao.Pinto@synopsys.com, bbrezillon@kernel.org, gregkh@linuxfoundation.org,
 rafael@kernel.org, Vitor Soares <Vitor.Soares@synopsys.com>,
 lorenzo@kernel.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org

Some I3C device drivers need to know which entry matches the
i3c_device object passed to the probe function

Let's move i3c_device_match_id() to device.c and export it so it can be
used by drivers.

Signed-off-by: Vitor Soares <vitor.soares@synopsys.com>
---
Changes in v6:
  Improve kerneldoc

Changes in v5:
  Add kerneldoc
  Improve commit message

Changes in v4:
  None

Changes in v3:
  Remove i3c_get_device_id
  Move i3c_device_match_id from drivers/i3c/master.c to drivers/i3c/device.c
  Export i3c_device_match_id

Changes in v2:
  move this function to drivers/i3c/device.c

 drivers/i3c/device.c       | 53 ++++++++++++++++++++++++++++++++++++++++++++++
 drivers/i3c/master.c       | 45 ---------------------------------------
 include/linux/i3c/device.h |  4 ++++
 3 files changed, 57 insertions(+), 45 deletions(-)

diff --git a/drivers/i3c/device.c b/drivers/i3c/device.c
index 69cc040..c15f5ca 100644
--- a/drivers/i3c/device.c
+++ b/drivers/i3c/device.c
@@ -201,6 +201,59 @@ struct i3c_device *dev_to_i3cdev(struct device *dev)
 EXPORT_SYMBOL_GPL(dev_to_i3cdev);
 
 /**
+ * i3c_device_match_id() - Returns the i3c_device_id entry matching @i3cdev
+ * @i3cdev: I3C device
+ * @id_table: I3C device match table
+ *
+ * Return: a pointer to an i3c_device_id object or NULL if there's no match.
+ */
+const struct i3c_device_id *
+i3c_device_match_id(struct i3c_device *i3cdev,
+		    const struct i3c_device_id *id_table)
+{
+	struct i3c_device_info devinfo;
+	const struct i3c_device_id *id;
+
+	i3c_device_get_info(i3cdev, &devinfo);
+
+	/*
+	 * The lower 32bits of the provisional ID is just filled with a random
+	 * value, try to match using DCR info.
+	 */
+	if (!I3C_PID_RND_LOWER_32BITS(devinfo.pid)) {
+		u16 manuf = I3C_PID_MANUF_ID(devinfo.pid);
+		u16 part = I3C_PID_PART_ID(devinfo.pid);
+		u16 ext_info = I3C_PID_EXTRA_INFO(devinfo.pid);
+
+		/* First try to match by manufacturer/part ID. */
+		for (id = id_table; id->match_flags != 0; id++) {
+			if ((id->match_flags & I3C_MATCH_MANUF_AND_PART) !=
+			    I3C_MATCH_MANUF_AND_PART)
+				continue;
+
+			if (manuf != id->manuf_id || part != id->part_id)
+				continue;
+
+			if ((id->match_flags & I3C_MATCH_EXTRA_INFO) &&
+			    ext_info != id->extra_info)
+				continue;
+
+			return id;
+		}
+	}
+
+	/* Fallback to DCR match. */
+	for (id = id_table; id->match_flags != 0; id++) {
+		if ((id->match_flags & I3C_MATCH_DCR) &&
+		    id->dcr == devinfo.dcr)
+			return id;
+	}
+
+	return NULL;
+}
+EXPORT_SYMBOL_GPL(i3c_device_match_id);
+
+/**
  * i3c_driver_register_with_owner() - register an I3C device driver
  *
  * @drv: driver to register
diff --git a/drivers/i3c/master.c b/drivers/i3c/master.c
index 5f4bd52..7667f84 100644
--- a/drivers/i3c/master.c
+++ b/drivers/i3c/master.c
@@ -270,51 +270,6 @@ static const struct device_type i3c_device_type = {
 	.uevent = i3c_device_uevent,
 };
 
-static const struct i3c_device_id *
-i3c_device_match_id(struct i3c_device *i3cdev,
-		    const struct i3c_device_id *id_table)
-{
-	struct i3c_device_info devinfo;
-	const struct i3c_device_id *id;
-
-	i3c_device_get_info(i3cdev, &devinfo);
-
-	/*
-	 * The lower 32bits of the provisional ID is just filled with a random
-	 * value, try to match using DCR info.
-	 */
-	if (!I3C_PID_RND_LOWER_32BITS(devinfo.pid)) {
-		u16 manuf = I3C_PID_MANUF_ID(devinfo.pid);
-		u16 part = I3C_PID_PART_ID(devinfo.pid);
-		u16 ext_info = I3C_PID_EXTRA_INFO(devinfo.pid);
-
-		/* First try to match by manufacturer/part ID. */
-		for (id = id_table; id->match_flags != 0; id++) {
-			if ((id->match_flags & I3C_MATCH_MANUF_AND_PART) !=
-			    I3C_MATCH_MANUF_AND_PART)
-				continue;
-
-			if (manuf != id->manuf_id || part != id->part_id)
-				continue;
-
-			if ((id->match_flags & I3C_MATCH_EXTRA_INFO) &&
-			    ext_info != id->extra_info)
-				continue;
-
-			return id;
-		}
-	}
-
-	/* Fallback to DCR match. */
-	for (id = id_table; id->match_flags != 0; id++) {
-		if ((id->match_flags & I3C_MATCH_DCR) &&
-		    id->dcr == devinfo.dcr)
-			return id;
-	}
-
-	return NULL;
-}
-
 static int i3c_device_match(struct device *dev, struct device_driver *drv)
 {
 	struct i3c_device *i3cdev;
diff --git a/include/linux/i3c/device.h b/include/linux/i3c/device.h
index 5ecb055..de102e4 100644
--- a/include/linux/i3c/device.h
+++ b/include/linux/i3c/device.h
@@ -188,6 +188,10 @@ static inline struct i3c_driver *drv_to_i3cdrv(struct device_driver *drv)
 struct device *i3cdev_to_dev(struct i3c_device *i3cdev);
 struct i3c_device *dev_to_i3cdev(struct device *dev);
 
+const struct i3c_device_id *
+i3c_device_match_id(struct i3c_device *i3cdev,
+		    const struct i3c_device_id *id_table);
+
 static inline void i3cdev_set_drvdata(struct i3c_device *i3cdev,
 				      void *data)
 {
-- 
2.7.4


_______________________________________________
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
