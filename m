Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91AE1C433EF
	for <linux-i3c@archiver.kernel.org>; Mon, 17 Jan 2022 18:20:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=BAoxzktxsjw6g3H3mc2Zyf2O7mOFL8QN0uuYx4NXOQc=; b=Wmk0jD4bfSV7zo
	uAMJDm9Ee3se8Eu5c53drhD3FCnPEPv74fAY+ENbNNOzNVyEPHo/BtoG3Ggsq7U7lpJUN0ZvEyny6
	ft3PNC+72sKaWBbyrOc0SDYfwfcXB07hEs7mJXvTZgV1U8eFUPQY/siVifMsOd0tE6yFW/gkvv1qP
	ETiIpeB8DdUe0J0SS4EHyXkWv3U70n/FKHpKXOrjbao3RqKWiHi2kvG/NcKdo7dH2P4QYRtrc9nFv
	2DpB7ZnYQX2U5LQdxUeuV/aYYHtwTWs4UfplXMrN8N2EaQoyYP2hxQ7VqV8tLxVmVJBBldbXBlLvk
	tawNVKGhrBj508PEZyIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n9WcL-00G4VC-RK; Mon, 17 Jan 2022 18:20:33 +0000
Received: from alexa-out-sd-02.qualcomm.com ([199.106.114.39])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n9W7O-00Fzpq-76
 for linux-i3c@lists.infradead.org; Mon, 17 Jan 2022 17:48:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1642441714; x=1673977714;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=rgWaKMcI/SNSLHvYlPmxv+NBvUWPkgT4L+32wU+EyhQ=;
 b=ydXMKxCHgC0Ft+tVwzc1QW3JAIKKl0qbrWoZRqyMAQOa92pFCV4U4CEj
 fnT8c4Nh5Z+jv9H0FHZc6lmyOH5bLzeB7ZVthlQYfCAvvmpBtScCuwtXw
 Bg94b/sLl1SC4j8EQi9StlwL3U3IrU8MVr/l2Zxe5ToUiIjStah3rI/eY Q=;
Received: from unknown (HELO ironmsg-SD-alpha.qualcomm.com) ([10.53.140.30])
 by alexa-out-sd-02.qualcomm.com with ESMTP; 17 Jan 2022 09:48:29 -0800
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg-SD-alpha.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jan 2022 09:48:29 -0800
Received: from nalasex01b.na.qualcomm.com (10.47.209.197) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.922.19; Mon, 17 Jan 2022 09:48:28 -0800
Received: from localhost (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.922.19; Mon, 17 Jan
 2022 09:48:27 -0800
From: Jamie Iles <quic_jiles@quicinc.com>
To: <linux-i3c@lists.infradead.org>
CC: Jamie Iles <quic_jiles@quicinc.com>
Subject: [PATCH 0/2] i3c: support for dynamically added i2c devices
Date: Mon, 17 Jan 2022 17:48:14 +0000
Message-ID: <20220117174816.1963463-1-quic_jiles@quicinc.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220117_094834_304616_2B1B2269 
X-CRM114-Status: UNSURE (   6.70  )
X-CRM114-Notice: Please train this message.
X-Mailman-Approved-At: Mon, 17 Jan 2022 10:20:33 -0800
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

Devices are currently added at controller initialization time with 
boardinfo, but the i2c subsystem also supports dynamically adding 
devices through a variety of mechanisms including user-space through 
sysfs, device tree overlays and ACPI.

This small series decouples registration from the boardinfo and then 
adds a notifier to add the devices at runtime.  A future series will 
build on this to allow adding the I2C devices through ACPI.

Jamie Iles (2):
  i3c: remove i2c board info from i2c_dev_desc
  i3c: support dynamically added i2c devices

 drivers/i3c/master.c       | 145 ++++++++++++++++++++++++++++++++++---
 include/linux/i3c/master.h |   1 -
 2 files changed, 136 insertions(+), 10 deletions(-)

-- 
2.32.0


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
