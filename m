Return-Path: <SRS0=CE6j=UF=lists.infradead.org=linux-i3c-bounces+linux-i3c=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	T_DKIMWL_WL_HIGH,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E617AC04AB5
	for <linux-i3c@archiver.kernel.org>; Thu,  6 Jun 2019 18:54:32 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 967F82083D
	for <linux-i3c@archiver.kernel.org>; Thu,  6 Jun 2019 18:54:32 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Awg0Cw7H";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="AZg1Yd1U"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 967F82083D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=synopsys.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=Hrk2N85iv1fEQEW8QxQ5GCIaJXPHppMn2nX3IbPEi60=; b=Awg
	0Cw7HQjSq9JIzGQPpxm16LmX6FoTb/PMf47Y113DKl2NpB7JnmLtCbWhaOhiyiUR2TCAE/GdCBisp
	wZ/nE9mtyk8CvX340m89DsXV1MUWpRWkMqXI122rDiqnD2d9/cSpjaMV/FD17LO3AUl917ZyNDjTr
	Irkxwo39Xj07yrrizS1ux2Vw85a2xy8/HDh0TZcvcKys0hraAWG20qaftxJxzMU0/JukZVIOb3Am9
	4rabVIfemdCOQtOdP8Vqn9zie4/Sk0eQbnrYlcav+u30r9h5gSakBDsgdqO6Bs5oyl+bRZvkiiez1
	WyRit3W68CDGHeco36qPgxm5cdg48hA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hYxWy-00009x-1B; Thu, 06 Jun 2019 18:54:32 +0000
Received: from dc2-smtprelay2.synopsys.com ([198.182.61.142]
 helo=smtprelay-out1.synopsys.com)
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hYu3m-0005Of-NK
 for linux-i3c@lists.infradead.org; Thu, 06 Jun 2019 15:12:11 +0000
Received: from mailhost.synopsys.com (mdc-mailhost1.synopsys.com
 [10.225.0.209])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 0FA1CC0BA5;
 Thu,  6 Jun 2019 15:11:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1559833908; bh=0xawz4OatXGzaBqtYj6nS/EfNnp/z+E5VwinuXJDtLQ=;
 h=From:To:Cc:Subject:Date:From;
 b=AZg1Yd1UvRb7GN5XhHpGuTWa45lSMBb5oho1rMamz+DMIBTzwL7++qDfU0zRK/ahA
 GL9HjOsdNcdTlNAkVuCluuUghwxxrgmekwGebFyCrdpFFyyQJOWnWlFEqZwjSXxobr
 mUh2O0o/TCY6YpLwj4d1ABhXEm58H6PjjJ27rDuUqPUAcu3mo10VKCLQ4mcLs44dNy
 uPfDqNBjHAqLhdpiFcU4mV1ccs66S84iMhQtdaeeYUmh8CmhsnbM99oJgU4fqZ1l7K
 LbM9q8e1/1+IFyl3At97an0TMptIBW+3AkKYmTP2gGdH3h0y9HG6uf3p4LB/tc1CWf
 Ra6x0KQZRT2cg==
Received: from de02.synopsys.com (de02.internal.synopsys.com [10.225.17.21])
 by mailhost.synopsys.com (Postfix) with ESMTP id AF36DA0057;
 Thu,  6 Jun 2019 15:12:06 +0000 (UTC)
Received: from de02dwia024.internal.synopsys.com
 (de02dwia024.internal.synopsys.com [10.225.19.81])
 by de02.synopsys.com (Postfix) with ESMTP id 9191D3FECC;
 Thu,  6 Jun 2019 17:12:06 +0200 (CEST)
From: Vitor Soares <Vitor.Soares@synopsys.com>
To: linux-iio@vger.kernel.org, linux-i2c@vger.kernel.org,
 linux-i3c@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/3] Add ST lsm6dso i3c support
Date: Thu,  6 Jun 2019 17:12:01 +0200
Message-Id: <cover.1559831663.git.vitor.soares@synopsys.com>
X-Mailer: git-send-email 2.7.4
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190606_081210_765576_8DF44362 
X-CRM114-Status: GOOD (  11.10  )
X-Mailman-Approved-At: Thu, 06 Jun 2019 11:54:30 -0700
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
Cc: Joao.Pinto@synopsys.com, bbrezillon@kernel.org, gregkh@linuxfoundation.org,
 rafael@kernel.org, Vitor Soares <Vitor.Soares@synopsys.com>,
 broonie@kernel.org, lorenzo.bianconi83@gmail.com
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org

This patch series add i3c support for STM LSM6DSO and LSM6DSR sensors.

It is also introduced i3c support on regmap api. Due the lack of
i3c devices HDR capables on the market the support for now is only for
i3c sdr mode by using i3c_device_do_priv_xfers() method.

Changes in v2:
  Change i3c_get_device_id() to drivers/i3c/device.c
  Add support for LSM6DSR

Vitor Soares (3):
  regmap: add i3c bus support
  i3c: Add i3c_get_device_id helper
  iio: imu: st_lsm6dsx: add i3c basic support for LSM6DSO and LSM6DSR

 drivers/base/regmap/Kconfig                 |  6 ++-
 drivers/base/regmap/Makefile                |  1 +
 drivers/base/regmap/regmap-i3c.c            | 60 +++++++++++++++++++++++
 drivers/i3c/device.c                        |  8 +++
 drivers/iio/imu/st_lsm6dsx/Kconfig          |  8 ++-
 drivers/iio/imu/st_lsm6dsx/Makefile         |  1 +
 drivers/iio/imu/st_lsm6dsx/st_lsm6dsx_i3c.c | 76 +++++++++++++++++++++++++++++
 include/linux/i3c/device.h                  |  1 +
 include/linux/regmap.h                      | 20 ++++++++
 9 files changed, 179 insertions(+), 2 deletions(-)
 create mode 100644 drivers/base/regmap/regmap-i3c.c
 create mode 100644 drivers/iio/imu/st_lsm6dsx/st_lsm6dsx_i3c.c

-- 
2.7.4


_______________________________________________
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
