Return-Path: <SRS0=FZv/=VM=lists.infradead.org=linux-i3c-bounces+linux-i3c=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B9701C7618F
	for <linux-i3c@archiver.kernel.org>; Mon, 15 Jul 2019 07:25:03 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8A68220868
	for <linux-i3c@archiver.kernel.org>; Mon, 15 Jul 2019 07:25:03 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="JFFZif2/";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="ZSarFZ81"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8A68220868
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=synopsys.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=LoPmxE6w7znaJ6SXu7DJqFnBG+2Wr1aY2P/1AqJYL9g=; b=JFFZif2/ylSZYn8aiUM0JlsvYq
	nwEImYxu952xomAV3qw8CYcS1gJqM3FV9uqJBNerP4N3a8sNnzM1wcK93mTMk30A3AYwa16rUhTYw
	QEgQQWsZk2evv1/IvMN/dkB2ihupvCdPPHEonwK7N0aR1K5dN/1lMoaz9HV5ftIGhtCtIoe8Ealbs
	/ZbwuSM/H9rJb+UWAO2LsENN2zGN7KeHyRmlNNsozWyOPFI+pB3O9yxfSh5T/6A+hh5OMRbdhor0I
	PoK1zB8a9whLfPk9hul8eV0UU1J2mQciwtGcAtjTkITJ/3iX1q7qj+XBunIl2lZ7iyYdct2HGlzPz
	+Ebv+0hQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hmvM7-00010L-4J; Mon, 15 Jul 2019 07:25:03 +0000
Received: from dc8-smtprelay2.synopsys.com ([198.182.47.102]
 helo=smtprelay-out1.synopsys.com)
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hlE1W-0000Ot-Nm
 for linux-i3c@lists.infradead.org; Wed, 10 Jul 2019 14:56:49 +0000
Received: from mailhost.synopsys.com (mdc-mailhost1.synopsys.com
 [10.225.0.209])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id B72EEC29D6;
 Wed, 10 Jul 2019 14:56:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1562770605; bh=sOpj8TE1EeqTTmLP+gVrHPLSRTjiZw/fiM84RPPD9QM=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:In-Reply-To:
 References:From;
 b=ZSarFZ81Y0ty/U857owIccjTuKsH8AFSrWfYL3mH1CkTSmsm83Ipv2f/2IMRtcH79
 QKsI+ZE37TIGNA5eh98OsXw7/aiaA3J3hfvE4oq0DKaqOUmHqB6p66UiH34MNOq+LC
 nZyQMZIbanEpJkRBALFV4GhiIwo33PfCLPRVmG8XlU5jwfsOAajgoUTh7PWJIQ8WR2
 m1Zb9URB/toRCjwJm4bCqTPVSD3KkmjoFeO4ul1kxyTD0uWXga+x4wrKVEcpRC6tOw
 iZbl8guZ9rM70PoawhO5qzOXHpQBrre+BWFCLaSr/Ju1BXCtq417FA2T04HIHJfypG
 V2JpW6LezXWUg==
Received: from de02.synopsys.com (de02.internal.synopsys.com [10.225.17.21])
 by mailhost.synopsys.com (Postfix) with ESMTP id 5BBF6A0061;
 Wed, 10 Jul 2019 14:56:42 +0000 (UTC)
Received: from de02dwia024.internal.synopsys.com
 (de02dwia024.internal.synopsys.com [10.225.19.81])
 by de02.synopsys.com (Postfix) with ESMTP id E64D83FA36;
 Wed, 10 Jul 2019 16:56:41 +0200 (CEST)
From: Vitor Soares <Vitor.Soares@synopsys.com>
To: linux-iio@vger.kernel.org, linux-i3c@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v3 2/3] i3c: move i3c_device_match_id to device.c and export it
Date: Wed, 10 Jul 2019 16:56:38 +0200
Message-Id: <debadccffef84c541601a97162ac656cd7c58478.1562767521.git.vitor.soares@synopsys.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1562767521.git.vitor.soares@synopsys.com>
References: <cover.1562767521.git.vitor.soares@synopsys.com>
In-Reply-To: <cover.1562767521.git.vitor.soares@synopsys.com>
References: <cover.1562767521.git.vitor.soares@synopsys.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190710_075646_806671_57B6E77E 
X-CRM114-Status: GOOD (  14.62  )
X-Mailman-Approved-At: Mon, 15 Jul 2019 00:24:58 -0700
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
Cc: Joao.Pinto@synopsys.com, rafael@kernel.org, gregkh@linuxfoundation.org,
 Vitor Soares <Vitor.Soares@synopsys.com>, broonie@kernel.org,
 bbrezillon@knernel.org, lorenzo@kernel.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org

The i3c device driver needs the i3c_device_id table.
Lets move it to device.c and export it to be used.

Signed-off-by: Vitor Soares <vitor.soares@synopsys.com>
---
Changes in v3:
  Remove i3c_get_device_id
  Move i3c_device_match_id from drivers/i3c/master.c to drivers/i3c/device.c
  Export i3c_device_match_id

Changes in v2:
  move this function to drivers/i3c/device.c

 drivers/i3c/device.c       | 46 ++++++++++++++++++++++++++++++++++++++++++++++
 drivers/i3c/master.c       | 45 ---------------------------------------------
 include/linux/i3c/device.h |  4 ++++
 3 files changed, 50 insertions(+), 45 deletions(-)

diff --git a/drivers/i3c/device.c b/drivers/i3c/device.c
index 69cc040..383df3b 100644
--- a/drivers/i3c/device.c
+++ b/drivers/i3c/device.c
@@ -200,6 +200,52 @@ struct i3c_device *dev_to_i3cdev(struct device *dev)
 }
 EXPORT_SYMBOL_GPL(dev_to_i3cdev);
 
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
 /**
  * i3c_driver_register_with_owner() - register an I3C device driver
  *
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
