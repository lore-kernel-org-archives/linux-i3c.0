Return-Path: <SRS0=A5bS=LQ=lists.infradead.org=linux-i3c-bounces+linux-i3c=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7FA28C48BDF
	for <linux-i3c@archiver.kernel.org>; Tue, 22 Jun 2021 15:10:44 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 56EC5600D3
	for <linux-i3c@archiver.kernel.org>; Tue, 22 Jun 2021 15:10:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 56EC5600D3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=vt/Y99yg4K+4HwAZJHbhaWS1PyeCPArkQAfEssbzk3M=; b=3rkpLlRQYUWO5s
	c0C8VOzxuD8I1KF+KkJjM45M9AQ7vTqwe3NIKPX1ZNsiQMnHtwnxEd9GiTZvvjk0nUhVRrH5A5MiK
	JIJzcdEHt/ePiv6x+r02ZaZYjnCI/OcQRarJOVU8KuJ7H7dB5UxUTvQ/15eHFMgVaTyE+HGvNdeKy
	UdtBkyUgaLilRPcJCK+22/6kfk1ejw2jZ7fhEmLJkgPdw/p2UOiHsSm0e3Ye+w72LiVFmsRH7VJlT
	BhjN2s6kw0PjliIO85tVZ9+0HXHJZxLpGgnrnhNtiZDpSyFbYxBUV1Y6gZM+04CWm8MFFn8QzqnMT
	Z0ETBZJatbPGR+fFC2Xw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lvi31-007cRI-Bd; Tue, 22 Jun 2021 15:10:43 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lvFot-002nCD-0H; Mon, 21 Jun 2021 09:02:18 +0000
X-UUID: 2b6a46c924bd4546983ef2a442e736db-20210621
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=z+bNDLyR79aZ0fBGDa0ao/ho7OeGuTPhOVtZMfIY25w=; 
 b=lNYSNIPoOJakxxViskAbyL5zRXBCL5B3AuZ+TFaw5A4lk/h2vGsFzNq2Mopk6w7kxDFepGtJnyxndKMTN62Dqw/TwzEIdSFsYwOJj5t1TQIllxk0t3MVSxszkrLNNsUx+2QrmwWAk3em7wJltr8blDwlYtbziuvIg4ESIocGy5Y=;
X-UUID: 2b6a46c924bd4546983ef2a442e736db-20210621
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <kewei.xu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1482984355; Mon, 21 Jun 2021 02:02:10 -0700
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 21 Jun 2021 02:02:08 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 21 Jun 2021 17:02:06 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 21 Jun 2021 17:02:05 +0800
From: <kewei.xu@mediatek.com>
To: <bbrezillon@kernel.org>
CC: <matthias.bgg@gmail.com>, <robh+dt@kernel.org>, <mark.rutland@arm.com>,
 <linux-i3c@lists.infradead.org>, <devicetree@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <linux-mediatek@lists.infradead.org>, <srv_heupstream@mediatek.com>,
 <leilk.liu@mediatek.com>, <qii.wang@mediatek.com>,
 <liguo.zhang@mediatek.com>, <xinping.qian@mediatek.com>
Subject: [PATCH V2 0/3] Introduce an attribute to choose timing setting 
Date: Mon, 21 Jun 2021 17:01:51 +0800
Message-ID: <1624266114-21539-1-git-send-email-kewei.xu@mediatek.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210621_020216_992497_EF6B35E0 
X-CRM114-Status: UNSURE (   7.14  )
X-CRM114-Notice: Please train this message.
X-Mailman-Approved-At: Tue, 22 Jun 2021 08:10:09 -0700
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

From 7f9f31c3e49e67e915a5137259a3f5bd62818339 Mon Sep 17 00:00:00 2001
From: Kewei Xu <kewei.xu@mediatek.com>
Date: Mon, 21 Jun 2021 16:36:09 +0800
Subject: [PATCH V2 0/3] Introduce an attribute to choose timing setting

Main changes compared to V1:
--split OFFSET_EXT_CONF into another patch.
--add attribute default-timing-adjust into dt-binding. 

Kewei Xu (3):
  i2c: mediatek: Add OFFSET_EXT_CONF setting back
  dt-bindings: i2c: add attribute default-timing-adjust
  i2c: mediatek: Isolate speed setting via dts for special devices

 .../devicetree/bindings/i2c/i2c-mt65xx.txt         |  2 +
 drivers/i2c/busses/i2c-mt65xx.c                    | 88 ++++++++++++++++++++--
 2 files changed, 83 insertions(+), 7 deletions(-)

-- 
1.9.1
 
-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
