Return-Path: <SRS0=/dce=4P=lists.infradead.org=linux-i3c-bounces+linux-i3c=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNWANTED_LANGUAGE_BODY,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 48F68C4BA3D
	for <linux-i3c@archiver.kernel.org>; Thu, 27 Feb 2020 11:31:37 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1E46224691
	for <linux-i3c@archiver.kernel.org>; Thu, 27 Feb 2020 11:31:37 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="BCResF0z";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="e/FbEKVO"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1E46224691
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=synopsys.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=R1YbTHD/+dv/t0B+7iZ9Ldf/ZJ8xr3NwFUdE43QneTM=; b=BCResF0z65QGJNwtixoQaMzcBc
	/EbiEB6dB9C6lPQsx5aUVl+Wct+pOOFBMoT1m/W4htQyZwem2PQxVBGexvPTRAUR/6ArhQpVk80H/
	K6PFqt9LyP0G1WEkG/wyf0shuTt/WDGrTZ7rCFb6ap0h8tm8jWtC75V3kOGQNJarEyuOGpPUwTnF5
	K0BbMyGuMsLsvvhe2gDXqb0m4dTGqd8phg2Xt6D5UlLLacV4XNF71RYd/b8xVkHkUeBbpdaueQ11L
	Y5VG8xK5eBGeOyNMT1qfa+5cE1zwqV+B46Z+/apwvVOvsC1jWdIzZRGvi7lT56CMguMCp0OZeMeId
	UJPZEt+Q==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j7HOC-00065p-D0; Thu, 27 Feb 2020 11:31:36 +0000
Received: from us03-smtprelay2.synopsys.com ([149.117.87.133]
 helo=smtprelay-out1.synopsys.com)
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j7HO9-00063S-9P
 for linux-i3c@lists.infradead.org; Thu, 27 Feb 2020 11:31:34 +0000
Received: from mailhost.synopsys.com (mdc-mailhost1.synopsys.com
 [10.225.0.209])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id CADA1C0F39;
 Thu, 27 Feb 2020 11:31:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1582803093; bh=g1PNO3dJwapptFFDIh94Tq3o6pR2tpjxuF2ZTzqCpQ4=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:In-Reply-To:
 References:From;
 b=e/FbEKVO3uUAhW35HLE3UQQMuPOCPLX/uZojqRUIr5iCZ06DlOcAHPT1pLDS9dk1s
 XXdvqpCWEhwHva9WR/nuOe3aykLPC71mJvosJulSktwQruEaS6DuCBYCtPbX/ohugy
 syUjLN78NP6Daq9YoKM5+r9aPkEo/aGPFe6jcgsMibEAjPBcO3DUeM34tXtKq93xTP
 RrLPBZBmeuCQheBy8u95FRjhtfXZUCADjs7ezByPbYQTOFa+GLJmc8V6kZjZLrT7A0
 T+yL04MmPRZLj2qVtTcUCD4JvVVOALBxKzIi0aQ4Eosg/d2hRmdWEjjTd7gH9sFl/I
 IspoVc4sQmJ+w==
Received: from de02.synopsys.com (germany.internal.synopsys.com [10.225.17.21])
 by mailhost.synopsys.com (Postfix) with ESMTP id 87526A005F;
 Thu, 27 Feb 2020 11:31:26 +0000 (UTC)
Received: from de02dwia024.internal.synopsys.com
 (de02dwia024.internal.synopsys.com [10.225.19.81])
 by de02.synopsys.com (Postfix) with ESMTP id 6C9633E9E4;
 Thu, 27 Feb 2020 12:31:26 +0100 (CET)
From: Vitor Soares <Vitor.Soares@synopsys.com>
To: pgaj@cadence.com,
	bbrezillon@kernel.org,
	linux-i3c@lists.infradead.org
Subject: [PATCH v2 2/4] i3c: Add modalias sysfs attribute
Date: Thu, 27 Feb 2020 12:31:07 +0100
Message-Id: <a90f64f830128cd12762153de7828b775574c156.1582796652.git.vitor.soares@synopsys.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1582796652.git.vitor.soares@synopsys.com>
References: <cover.1582796652.git.vitor.soares@synopsys.com>
In-Reply-To: <cover.1582796652.git.vitor.soares@synopsys.com>
References: <cover.1582796652.git.vitor.soares@synopsys.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200227_033133_470970_DEA902B2 
X-CRM114-Status: UNSURE (   9.29  )
X-CRM114-Notice: Please train this message.
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
Cc: Boris Brezillon <boris.brezillon@collabora.com>,
 linux-kernel@vger.kernel.org, Vitor Soares <Vitor.Soares@synopsys.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org

Create modalias sysfs attribute for modalias devices.

Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
Signed-off-by: Vitor Soares <vitor.soares@synopsys.com>
---
 drivers/i3c/master.c | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/drivers/i3c/master.c b/drivers/i3c/master.c
index b6db828..925e1ed 100644
--- a/drivers/i3c/master.c
+++ b/drivers/i3c/master.c
@@ -241,12 +241,34 @@ static ssize_t hdrcap_show(struct device *dev,
 }
 static DEVICE_ATTR_RO(hdrcap);
 
+static ssize_t modalias_show(struct device *dev,
+			     struct device_attribute *da, char *buf)
+{
+	struct i3c_device *i3c = dev_to_i3cdev(dev);
+	struct i3c_device_info devinfo;
+	u16 manuf, part, ext;
+
+	i3c_device_get_info(i3c, &devinfo);
+	manuf = I3C_PID_MANUF_ID(devinfo.pid);
+	part = I3C_PID_PART_ID(devinfo.pid);
+	ext = I3C_PID_EXTRA_INFO(devinfo.pid);
+
+	if (I3C_PID_RND_LOWER_32BITS(devinfo.pid))
+		return sprintf(buf, "i3c:dcr%02Xmanuf%04X", devinfo.dcr,
+			       manuf);
+
+	return sprintf(buf, "i3c:dcr%02Xmanuf%04Xpart%04Xext%04X",
+		       devinfo.dcr, manuf, part, ext);
+}
+static DEVICE_ATTR_RO(modalias);
+
 static struct attribute *i3c_device_attrs[] = {
 	&dev_attr_bcr.attr,
 	&dev_attr_dcr.attr,
 	&dev_attr_pid.attr,
 	&dev_attr_dynamic_address.attr,
 	&dev_attr_hdrcap.attr,
+	&dev_attr_modalias.attr,
 	NULL,
 };
 ATTRIBUTE_GROUPS(i3c_device);
-- 
2.7.4


_______________________________________________
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
