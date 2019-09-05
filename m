Return-Path: <SRS0=amWc=XA=lists.infradead.org=linux-i3c-bounces+linux-i3c=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 94176C3A5AA
	for <linux-i3c@archiver.kernel.org>; Thu,  5 Sep 2019 10:00:56 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 681F222CF5
	for <linux-i3c@archiver.kernel.org>; Thu,  5 Sep 2019 10:00:56 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="VxUd6i8I";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="KmzLGi69"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 681F222CF5
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=synopsys.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=pQBaOJnvIebdaQ+2GMsOtt+uJeEv0v3s5BbizNm7+hI=; b=VxU
	d6i8IxRW9CahPT93qi9NEpxWeItHNTDeiMHSb0JpnhPqfh5P5naKs9vC7XWZZ3mYnLuZkycPYSKpj
	2h+FqTqyvclH4dIBq19ThPfoTE3f/ehMB9XMP1s3c+RK7ecKGgsjIhq1dXXzgG6Sd27u1rSI3FImT
	iaZzM1CrwB6OFxo3dH9KkF83Mu8SV8QYGImMEk+aFebX0CfKh6wYm3v4AzwzSyMZ40LP3KR+MlG6P
	nX6oKNvQvw33iF9cK2lNDuc4vtH1+lwi7Zvl0sTxeMFJBjsLKuJFPJ30hiLzn6tvyS1emySgQugi9
	4DNTMmxf1jvr5ouYDdLDCE3C5HHygAQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1i5oZT-0007eQ-Ul; Thu, 05 Sep 2019 10:00:55 +0000
Received: from dc8-smtprelay2.synopsys.com ([198.182.47.102]
 helo=smtprelay-out1.synopsys.com)
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1i5oZQ-0007cD-Q5
 for linux-i3c@lists.infradead.org; Thu, 05 Sep 2019 10:00:54 +0000
Received: from mailhost.synopsys.com (mdc-mailhost1.synopsys.com
 [10.225.0.209])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id E90BFC0DD1;
 Thu,  5 Sep 2019 10:00:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1567677651; bh=Ws+N6vdFI0+AOibwXemxt/naJeO+djtgi6jeEObd+2k=;
 h=From:To:Cc:Subject:Date:From;
 b=KmzLGi69zmkUE97UqDPhuZHHS3CZ2VqB/5GKMcVxz5uniySvAu2h5ckXlQ5n1MrNI
 9Y7kNaQ2YjS0bv/V1eC37BI9F9EEiZvY92IV9+9iRr7DZmNPOp4hQ8fLEKWhYlfqme
 KXT/abrF2Fav3g/f0nkoO51JDh7GXa5HINIzf2PFlErhOBicsfKrWfF9nS2HA9hOIK
 G4rrYXYUOhSRqNpcVO+teO6JN0lunqaqPrsm3x6zl1ZwTv+GHpi3uxofzNKnEBiTUs
 ZAQ1Qu9PW0EdMiBicdHGlmnjUEY9KoWzdHJNb9OUjuthEDghO0aIw4MUcTOPvsZagh
 BhD9zzO/QjNwQ==
Received: from de02.synopsys.com (germany.internal.synopsys.com [10.225.17.21])
 by mailhost.synopsys.com (Postfix) with ESMTP id 56C51A005F;
 Thu,  5 Sep 2019 10:00:49 +0000 (UTC)
Received: from de02dwia024.internal.synopsys.com
 (de02dwia024.internal.synopsys.com [10.225.19.81])
 by de02.synopsys.com (Postfix) with ESMTP id 33B6F3F3AF;
 Thu,  5 Sep 2019 12:00:49 +0200 (CEST)
From: Vitor Soares <Vitor.Soares@synopsys.com>
To: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-i3c@lists.infradead.org
Subject: [PATCH v3 0/5] i3c: detach/free device fail pre_assign_dyn_addr()
Date: Thu,  5 Sep 2019 12:00:33 +0200
Message-Id: <cover.1567608245.git.vitor.soares@synopsys.com>
X-Mailer: git-send-email 2.7.4
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190905_030052_857042_3D24B7FF 
X-CRM114-Status: UNSURE (   8.84  )
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
Cc: mark.rutland@arm.com, Joao.Pinto@synopsys.com, bbrezillon@kernel.org,
 Vitor Soares <Vitor.Soares@synopsys.com>, pgaj@cadence.com, robh+dt@kernel.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org

As for today, the I3C framework is keeping in memory and master->bus.devs
list the devices that fail during pre_assign_dyn_addr() and send them on
DEFSLVS command.

According to MIPI I3C Bus spec the DEFSLVS command is used to inform any
Secondary Master about the Dynamic Addresses that were assigned to I3C
devices and the I2C devices present on the bus.

This issue could be fixed by changing i3c_master_defslvs_locked() to
ignore unaddressed i3c devices but the i3c_dev_desc would be allocated and
attached to HC unnecessarily. This can cause that some HC aren't able to
do DAA for HJ capable devices due of lack of space.

This patch-series propose to detach/free devices that are failing during
pre_assign_dyn_addr() and to propagate i3c_boardinfo, if available, to
i3c_dev_desc during i3c_master_add_i3c_dev_locked(). Besides the fix for
the problem mention above, this change will permit to describe devices
with a preferable dynamic address (important due to priority reason) but
without a static address in DT.

In addition, I'm improving the management of the Data Address Table in
DW I3C Master by keeping the free slots consecutive.

Change in v3:
  - Change cover letter
  - Change commit message for patch 1
  - Add Rob rb-tags

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
  dt-bindings: i3c: Make 'assigned-address' valid if static address == 0
  dt-bindings: i3c: add a note for no guarantee of 'assigned-address'
    use
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
