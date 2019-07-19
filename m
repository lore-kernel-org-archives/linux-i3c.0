Return-Path: <SRS0=tlLU=VQ=lists.infradead.org=linux-i3c-bounces+linux-i3c=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E4E78C76188
	for <linux-i3c@archiver.kernel.org>; Fri, 19 Jul 2019 11:19:33 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BDC4621849
	for <linux-i3c@archiver.kernel.org>; Fri, 19 Jul 2019 11:19:33 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="O+3D3/Du";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="glqCLQAg"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BDC4621849
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=synopsys.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=NJVzIObvJKntm3sOya8ylwWC8oHuVUrvjN35cRXJn7M=; b=O+3D3/DuXecUkawSMXgPK1S4yp
	NHUogC3ny7U+yB6ByyBriuJm7eENF8+XlR4Ea+T8FkTK11ZNvKx4h0lnz0OXdKvurmhZ/7NHfURPB
	4lbVpJygzhkBzx/Mp6nU48R3WJiKr1w1KbjQC6kTKzC6/GmfMjaBi7m/EIWFmTarVuLc/8juVXmBQ
	xjRfkfn8vKZI2TyiLqTnQpQa+8GFYM9QUQj+eXztpHakbg2KIvqEw94mQzvUMckhqnSjHaqaRCSrT
	3QJ1C9lj/GjcCrTpA8nfscoXrmltkvwhvZ3wXZMcUPF7SRybMACqVDPA82Gc3BXXskhhRVGpOQeOK
	ckIqKjdA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hoQvF-0007S7-4g; Fri, 19 Jul 2019 11:19:33 +0000
Received: from smtprelay-out1.synopsys.com ([198.182.61.142])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hoQvC-0007R2-BB
 for linux-i3c@lists.infradead.org; Fri, 19 Jul 2019 11:19:31 +0000
Received: from mailhost.synopsys.com (mdc-mailhost2.synopsys.com
 [10.225.0.210])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 5F050C1211;
 Fri, 19 Jul 2019 11:19:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1563535168; bh=ozY6liiCOB5Amv30ZINSKCf5LrlfWFBv/ReyJjaLhQc=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:In-Reply-To:
 References:From;
 b=glqCLQAgPVlRGhdUj8UaYqexWLu9qKQzme1Lq2/SGUBKkj4sktVhz2gJnvlFQyS/h
 bMyOgRBU8HntVIGfh6fIR9dvvJWwHRwzXyLnw2Kw+0F94HCIrSuOi6jU2odkxCrHEk
 QMikzNrsVlpisgHL3Ovp3OJNUWb6XizMLOa+ilaQOijJfVNSiRqJuu3Ej+o++HcpZX
 L6OL2gOFEFvMPJiUuVPMQ90224Ysf3ggVk/SHpq861NRx9yrHSK0DMQxsqI8uCihBA
 HvGUPDk2dNxUNVFCp7720mG5uSKxXADhuDxD/wdcycg+YKU8EVaFP73SxLU9moQtxu
 xJ/KfKyRMUxjw==
Received: from de02.synopsys.com (de02.internal.synopsys.com [10.225.17.21])
 by mailhost.synopsys.com (Postfix) with ESMTP id 8A899A0057;
 Fri, 19 Jul 2019 11:19:26 +0000 (UTC)
Received: from de02dwia024.internal.synopsys.com
 (de02dwia024.internal.synopsys.com [10.225.19.81])
 by de02.synopsys.com (Postfix) with ESMTP id 0F05C3CA31;
 Fri, 19 Jul 2019 13:19:26 +0200 (CEST)
From: Vitor Soares <Vitor.Soares@synopsys.com>
To: linux-iio@vger.kernel.org, linux-i3c@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v5 1/2] i3c: move i3c_device_match_id to device.c and export it
Date: Fri, 19 Jul 2019 13:19:04 +0200
Message-Id: <40addcc18ac82a3156cd86e153e2b4fc1de2fe54.1563533343.git.vitor.soares@synopsys.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1563533342.git.vitor.soares@synopsys.com>
References: <cover.1563533342.git.vitor.soares@synopsys.com>
In-Reply-To: <cover.1563533342.git.vitor.soares@synopsys.com>
References: <cover.1563533342.git.vitor.soares@synopsys.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190719_041930_400248_15C9FC6B 
X-CRM114-Status: GOOD (  15.91  )
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
index 69cc040..5349059 100644
--- a/drivers/i3c/device.c
+++ b/drivers/i3c/device.c
@@ -201,6 +201,59 @@ struct i3c_device *dev_to_i3cdev(struct device *dev)
 EXPORT_SYMBOL_GPL(dev_to_i3cdev);
 
 /**
+ * i3c_device_match_id() - Returns the I3C device match id in @i3cdev
+ * @i3cdev: I3C device
+ * @id_table: I3C device match table
+ *
+ * Return: a pointer to I3C device id object.
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
