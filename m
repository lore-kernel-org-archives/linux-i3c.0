Return-Path: <SRS0=tlLU=VQ=lists.infradead.org=linux-i3c-bounces+linux-i3c=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 85194C76188
	for <linux-i3c@archiver.kernel.org>; Fri, 19 Jul 2019 13:31:06 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5ECC32184E
	for <linux-i3c@archiver.kernel.org>; Fri, 19 Jul 2019 13:31:06 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="rkGScbJ+";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="iydk+SgU"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5ECC32184E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=synopsys.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=cvJZQFespUE037YhiIapXkQK2E59D4fs77oE57t5lWo=; b=rkG
	ScbJ++lTDPLFG85geQ7kkhSdW0GVPO84SwUXUumfoFpxyd+y1uWF9Wwq8Jaj98p6oajGzMGtTTbMX
	tGUKxxh1poVqRyT785E8t7dNasq93+iSyQTwILDnTZvBKMX3Qs0bnP6RAVQtBeT2UslCUAZwSqXVt
	hXM4XJ9L+nir3DMxBSIstkl40WKfCpLYBHeLrcxqjkid/K6IjYnccy4mEqbkyfxCEL7XKM3EcvzOB
	hEC5YvcfqHDUoR4y2nJ5t+g3vPzXlDp+w1ibq54M1Pde3deuptIPhM2ks/aMsxKpt/MMfKddVWLHC
	XBGYXnn0qIgLNg3F75WIQB4v+AApN/Q==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hoSyX-00047W-S0; Fri, 19 Jul 2019 13:31:05 +0000
Received: from dc8-smtprelay2.synopsys.com ([198.182.47.102]
 helo=smtprelay-out1.synopsys.com)
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hoSyV-00045l-7C
 for linux-i3c@lists.infradead.org; Fri, 19 Jul 2019 13:31:04 +0000
Received: from mailhost.synopsys.com (mdc-mailhost2.synopsys.com
 [10.225.0.210])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 6C5FDC1C2C;
 Fri, 19 Jul 2019 13:30:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1563543058; bh=jpvevAfVqqSo+PGNCx5Sc+HAJGWPFoUHv+j21MEN228=;
 h=From:To:Cc:Subject:Date:From;
 b=iydk+SgUCWwAhcecW+1dVV0hNqtSoqxOehHwLQpEoY3wy5rGQ4i84FWBKSbp/O3Nb
 Pa+aPMcMCzwrmf/JcZW8EZapIxDWRn7/BAUEjBPdjKuM/cc8da7U0oCD/E5Ujx4h4b
 XgBmT/1OZkYTNZ1x5I4Kq0n87wMj5Qn8BNEn6X2QODWwgkU6beuXP8StUQaO/3TQ0g
 iY+fGoz5+Oc2vv0jrrdLO92ZWRUwQcUuoZz6gpMh16yFBHi5AL+f5Y3oVz+AD0/ft4
 Qx3faeQ17YVWw8aOtS/AFZJEg7f0/xptm8U83lLb5aT7ei+YqhZP2E7izy4/Czjk/S
 EbxwdgCFg54mA==
Received: from de02.synopsys.com (de02.internal.synopsys.com [10.225.17.21])
 by mailhost.synopsys.com (Postfix) with ESMTP id 01823A005D;
 Fri, 19 Jul 2019 13:30:56 +0000 (UTC)
Received: from de02dwia024.internal.synopsys.com
 (de02dwia024.internal.synopsys.com [10.225.19.81])
 by de02.synopsys.com (Postfix) with ESMTP id D46E63EBC1;
 Fri, 19 Jul 2019 15:30:56 +0200 (CEST)
From: Vitor Soares <Vitor.Soares@synopsys.com>
To: linux-iio@vger.kernel.org, linux-i3c@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v6 0/2] Add ST lsm6dso i3c support
Date: Fri, 19 Jul 2019 15:30:53 +0200
Message-Id: <cover.1563542515.git.vitor.soares@synopsys.com>
X-Mailer: git-send-email 2.7.4
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190719_063103_292272_80AFBA17 
X-CRM114-Status: UNSURE (   9.35  )
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

Change in v6:
  Improve kerneldoc

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
