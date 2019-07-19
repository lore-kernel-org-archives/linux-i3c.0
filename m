Return-Path: <SRS0=tlLU=VQ=lists.infradead.org=linux-i3c-bounces+linux-i3c=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 00848C76196
	for <linux-i3c@archiver.kernel.org>; Fri, 19 Jul 2019 11:19:34 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CE5912184E
	for <linux-i3c@archiver.kernel.org>; Fri, 19 Jul 2019 11:19:33 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="e+zgqzSB";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="QYKr9eER"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CE5912184E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=synopsys.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=nhpW3f1yLc42Zz5Oc1WH7sqkuZ3tWWZmjEODF9A0/4U=; b=e+z
	gqzSB8kOswoxYbYiza2O1g8V2zwtkpQKbSb0Q613bdIou0RX79hoXNqNUiUP8tWz7mGK59D/3plfK
	xmfeIl5fmbnLysXRSgghkmptwiRgLMV89S/QE6S3xRc3xHJlIZ9JwKmtIcFTwgHXdkwpGpAMjTFqp
	izyHGOMUVbqidxcNkCTOXB+uS1DrMsyA/EC9mNgLhQhtRKVt6l4HT2o6+y1ngzVEO9PB0r9y3c84w
	yY0qKN1zvC6oR/n8J84YmgIppUCrwKVKN7VNFCg5BiB0Z93NkmlshLmP15jPUmah+QpPU/BzMqToO
	SWqd62J8zlvFVNK28xRmbFMSJBm9nbw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hoQvF-0007SE-AA; Fri, 19 Jul 2019 11:19:33 +0000
Received: from dc8-smtprelay2.synopsys.com ([198.182.47.102]
 helo=smtprelay-out1.synopsys.com)
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hoQvC-0007R1-Jy
 for linux-i3c@lists.infradead.org; Fri, 19 Jul 2019 11:19:32 +0000
Received: from mailhost.synopsys.com (mdc-mailhost1.synopsys.com
 [10.225.0.209])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id C0102C1C2B;
 Fri, 19 Jul 2019 11:19:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1563535168; bh=MiBjCxUDzzebeZuhxJ+pM4/wZnrQW997011ijzYonDs=;
 h=From:To:Cc:Subject:Date:From;
 b=QYKr9eERoADTDOYRL4bYLZ8LSHT4kAGPGsqCd23c53VNJaZCz3PpdzMGsWWGfDtAO
 MrraABI3prkvVdRGFUm8IrMomQPrJek0adEzVB6j1R9+aTePGDecKrquYJAHoA2xiE
 XQExfzMmhR0fGcVmPC/RvqmALreSq7a4h+hqNhdm7S1MD6QUtDz5sZeiNJMfHJPnr4
 BsA2q7fpJesYm7ig7MQUnTWdg1aopKkJOfioCORzIVVf3/Oi97RXsX7pHD5rG82cKk
 fIEpwzb1tTSX4AQIzYVqEKSJfble0wB9afycpyLwMYsWVzTZWs1LKYHsWENcHEGX/d
 Lrb2nK0OBdngg==
Received: from de02.synopsys.com (germany.internal.synopsys.com [10.225.17.21])
 by mailhost.synopsys.com (Postfix) with ESMTP id 37902A0060;
 Fri, 19 Jul 2019 11:19:26 +0000 (UTC)
Received: from de02dwia024.internal.synopsys.com
 (de02dwia024.internal.synopsys.com [10.225.19.81])
 by de02.synopsys.com (Postfix) with ESMTP id 0C6A03CA2A;
 Fri, 19 Jul 2019 13:19:26 +0200 (CEST)
From: Vitor Soares <Vitor.Soares@synopsys.com>
To: linux-iio@vger.kernel.org, linux-i3c@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v5 0/2] Add ST lsm6dso i3c support
Date: Fri, 19 Jul 2019 13:19:03 +0200
Message-Id: <cover.1563533342.git.vitor.soares@synopsys.com>
X-Mailer: git-send-email 2.7.4
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190719_041930_662237_8EFC0D0E 
X-CRM114-Status: UNSURE (   9.56  )
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
Cc: Joao.Pinto@synopsys.com, bbrezillon@kernel.org, gregkh@linuxfoundation.org,
 rafael@kernel.org, Vitor Soares <Vitor.Soares@synopsys.com>,
 lorenzo@kernel.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org

This patch-series add i3c support for STM LSM6DSO and LSM6DSR sensors.

It is also introduced i3c support on regmap API. Due to the lack of
i3c devices with HDR feature on the market the support, for now, is only
for i3c SDR mode by using i3c_device_do_priv_xfers() method.

The i3c regmap API is already available in the Git repository at:
  https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regmap.git
  tags/regmap-i3c

Change in v5:
  Remove regmap-i3c patch, already applied in regmap tree
  Fix warning when compiling in 64-bit architecture

Change in v4:
  remover hw_id variable from st_lsm6dsx_i3c_probe()

Change in v3:
  Update st_lsm6dsx_probe() call
  Remove i3c_get_device_id() and use i3c_device_match_id()

Changes in v2:
  Change i3c_get_device_id() to drivers/i3c/device.c
  Add support for LSM6DSR

Vitor Soares (2):
  i3c: add i3c_get_device_id helper
  iio: imu: st_lsm6dsx: add i3c basic support for LSM6DSO and LSM6DSR

 drivers/i3c/device.c                        | 53 +++++++++++++++++++++++++++
 drivers/i3c/master.c                        | 45 -----------------------
 drivers/iio/imu/st_lsm6dsx/Kconfig          |  8 +++-
 drivers/iio/imu/st_lsm6dsx/Makefile         |  1 +
 drivers/iio/imu/st_lsm6dsx/st_lsm6dsx_i3c.c | 57 +++++++++++++++++++++++++++++
 include/linux/i3c/device.h                  |  4 ++
 6 files changed, 122 insertions(+), 46 deletions(-)
 create mode 100644 drivers/iio/imu/st_lsm6dsx/st_lsm6dsx_i3c.c

-- 
2.7.4


_______________________________________________
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
