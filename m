Return-Path: <SRS0=vbyI=W6=lists.infradead.org=linux-i3c-bounces+linux-i3c=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 54B9EC3A5A2
	for <linux-i3c@archiver.kernel.org>; Tue,  3 Sep 2019 10:36:09 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2AB2D22D6D
	for <linux-i3c@archiver.kernel.org>; Tue,  3 Sep 2019 10:36:09 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="AIcKlNMz";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="hGjVDQes"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2AB2D22D6D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=synopsys.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=QfXZBApqaisgp/6w9MKCRHj+G1klUf1BIWZHPrg1uak=; b=AIc
	KlNMzt7jhZa6k8YI47jjcOhfJh4ccj4o9bppoJzX1woPkhgTYRK7lfIHccDm4pBAhGyw0z87Iio1g
	dtvzVQ35yBvrhCHjcqO3Vlnl0x9jyn1CAiqhOtzo2bgZqGX6P36HWraU3PmtniFskWRwjDtRYtb5u
	oNypi8cxBSOo1FbE3dIx6HEUYyXwLm6TzAEgPrc8tKKOMMqUvBmuXNLQBd851y3CmsZ2WvhqCquQx
	71VqTIrmaWuwVb7VK3D6pXDn2A+7Se/+qUk3rbmNVm/eY6nF79slsmK4fV2ldw5x23gm3vd4+5KcL
	fEdtd0qnnEu07dWM2gRVjLx4lf+0EXA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1i56AS-0008DL-Q2; Tue, 03 Sep 2019 10:36:08 +0000
Received: from dc2-smtprelay2.synopsys.com ([198.182.61.142]
 helo=smtprelay-out1.synopsys.com)
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1i56AP-00089o-Uq
 for linux-i3c@lists.infradead.org; Tue, 03 Sep 2019 10:36:07 +0000
Received: from mailhost.synopsys.com (mdc-mailhost1.synopsys.com
 [10.225.0.209])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 77A15C0488;
 Tue,  3 Sep 2019 10:35:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1567506960; bh=NX8ZFWZsy087DTYRdDP6NLFudhTQiDOn0etqPDZTKug=;
 h=From:To:Cc:Subject:Date:From;
 b=hGjVDQesCToHVpZbms1ETSQ34WVup4ugLjjv4xmT4MusnEYMcsF1xY+Na5ViMBw7E
 ki+cA5AKmxATdKeeGzYFwpIVxzf96j7BEbKyxVv3aJPMx3jTKrcKSJAbdTJEP2mE+K
 STJdUz48Sq6XZ2WYFaunX0+JqUbE5egbhmNfV+TU2uoJyq4uVn1al2yRjnlNGFrbWq
 TTc7nhDmJ8fOSh6DnPOAQYA1L5AlBy++Y6Td3ln6INrc6S0t2fze5lQLwqDG1F1Ex6
 g6/TpLJ6suyvvuV2OE0vzDO1fXWADmY5H40CS2k1KcXndu0LeeCO8JqZSHC973A/vg
 p+qojwQ3pJhgw==
Received: from de02.synopsys.com (germany.internal.synopsys.com [10.225.17.21])
 by mailhost.synopsys.com (Postfix) with ESMTP id B2749A005C;
 Tue,  3 Sep 2019 10:35:56 +0000 (UTC)
Received: from de02dwia024.internal.synopsys.com
 (de02dwia024.internal.synopsys.com [10.225.19.81])
 by de02.synopsys.com (Postfix) with ESMTP id 8DFE73C0D1;
 Tue,  3 Sep 2019 12:35:56 +0200 (CEST)
From: Vitor Soares <Vitor.Soares@synopsys.com>
To: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-i3c@lists.infradead.org
Subject: [PATCH v2 0/5] i3c: remove device if failed on pre_assign_dyn_addr()
Date: Tue,  3 Sep 2019 12:35:49 +0200
Message-Id: <cover.1567437955.git.vitor.soares@synopsys.com>
X-Mailer: git-send-email 2.7.4
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190903_033606_000157_66CD02F2 
X-CRM114-Status: GOOD (  10.62  )
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
Cc: mark.rutland@arm.com, Joao.Pinto@synopsys.com, bbrezillon@kernel.org,
 Vitor Soares <Vitor.Soares@synopsys.com>, pgaj@cadence.com, robh+dt@kernel.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org

This patch series remove the devices that fail during
pre_assign_dyn_addr() and were being sent on DEFSVLS command.
With the change above, during the i3c_master_add_i3c_dev_locked() is
necessary to check if the device has i3c_boardinfo and try to assign the
i3c_dev_boardinfo->init_dyn_addr if there no oldev. This change will
allow to describe in DT device with preferable dynamic address but without
static address.

Change in v2:
  - Move out detach/free the i3c_dev_desc from pre_assign_dyn_addr()
  - Change i3c_master_search_i3c_boardinfo(newdev) to
  i3c_master_init_i3c_dev_boardinfo(newdev)
  - Add fixes, stable tags on patch 2
  - Add a note for no guarantee of 'assigned-address' use

Vitor Soares (5):
  i3c: master: detach and free device if pre_assign_dyn_addr() fails
  i3c: master: make sure ->boardinfo is initialized in
    add_i3c_dev_locked()
  dt-bindings: i3c: make 'assigned-address' valid if static address == 0
  dt-bindings: i3c: add a note for no guarantee of 'assigned-address' use
  i3c: master: dw: reattach device on first available location of
    address table

 Documentation/devicetree/bindings/i3c/i3c.txt | 15 ++++++--
 drivers/i3c/master.c                          | 49 ++++++++++++++++++++++-----
 drivers/i3c/master/dw-i3c-master.c            | 16 +++++++++
 3 files changed, 68 insertions(+), 12 deletions(-)

-- 
2.7.4


_______________________________________________
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
