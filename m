Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB584C4450B
	for <linux-i3c@archiver.kernel.org>; Wed, 15 Jul 2026 01:30:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=uWobqVYRJEf1FTFqnNadm5KoSJn8ePWwJHkJnQV4vJw=; b=YEzbV2zTwOpGCV
	5b1+IJ3txShRDEhZGSZ7GZarKnb33bOXVPNeqUSReeJ3kV5pvXFs2Z6k+3Om9ktLN383xxm87XjvO
	sn/pAbSA+xtcUWpWj4sU5qtu4cMRUxIe/zy/ucbseUaHUG/amWq878ekOXQ8TJhqJosjCKaA5UHdp
	wiU35ZC8jxDcYJOuHJy7QF3ThKpzSWnisngsM5CDAW8OeP5mkD31GLfFS0C/rVnHnbnD34zKS7go1
	GVZ//RE+OGYBvrqptP1CtZF4w8eRqZlqWvpz6R4p6LTonp0pUCyjAhzCCcPf51odvvlqk83OmdhN6
	bAenmk0NIZhoJmN7erZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjoRx-0000000DZEY-40pZ;
	Wed, 15 Jul 2026 01:30:13 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjoRw-0000000DZEP-3JE2
	for linux-i3c@bombadil.infradead.org;
	Wed, 15 Jul 2026 01:30:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=yB5TH4hlqoGeoSQcZOr2XHZtoPO3PIWTiQk7CGe+RGk=; b=MX8Nc1DDrp+SOquaOa22bBS5BW
	Y3fDAKqzu9QocYORzLt5KgfJNIjX+4Y6rLh0ASIswM2ETYwgEFsZFMUAqDpcIi5Pd3CPVKNdmDThe
	ZtJEYGkc7LlhTjFT73yDzKvxb8IUbGW01YhsuaM0YysUaq8LZ8jF/b/gWi77WifARQi81KdBhxWJ5
	5eHAej9T+yvNN0MNFjFuwuW34L5exNDGItfgvIfl7Tj5ggGQn/v50yTqXzKfcwQXrj/VXoSTdZ150
	6BWjyjZVkgyKJRJcDGh9lb8NE/ktlKMgOR0c+Jq0Y9objFIz8fUqdnEru91vSP7V+1SQHCYucz76n
	eNNnaePw==;
Received: from mailgw.kylinos.cn ([124.126.103.232])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wjoRt-0000000CxNv-0VjA
	for linux-i3c@lists.infradead.org;
	Wed, 15 Jul 2026 01:30:11 +0000
X-UUID: aee381327fec11f1aa26b74ffac11d73-20260715
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.12,REQID:c5ca60d9-6ab8-42fc-9f1f-aa2f637e8082,IP:0,U
	RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-5
X-CID-META: VersionHash:e7bac3a,CLOUDID:d0edbeaca2018a80eda67520ba0f0429,BulkI
	D:nil,BulkQuantity:0,Recheck:0,SF:102|865|898,TC:nil,Content:0|15|50,EDM:-
	3,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,A
	V:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: aee381327fec11f1aa26b74ffac11d73-20260715
X-User: pengcan@kylinos.cn
Received: from lenovo [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <pengcan@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 1668981237; Wed, 15 Jul 2026 09:29:54 +0800
From: Can Peng <pengcan@kylinos.cn>
To: jorge.marques@analog.com,
	alexandre.belloni@bootlin.com,
	Frank.Li@nxp.com
Cc: linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Can Peng <pengcan@kylinos.cn>
Subject: [PATCH] i3c: master: adi: add OF module alias for autoloading
Date: Wed, 15 Jul 2026 09:29:49 +0800
Message-ID: <20260715012949.180245-1-pengcan@kylinos.cn>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260715_023009_857515_FD7FB4F3 
X-CRM114-Status: UNSURE (   7.35  )
X-CRM114-Notice: Please train this message.
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

The Analog Devices I3C master driver can be built as a module and uses
adi_i3c_master_of_match as its OF match table, but the table is not
exported for module alias generation.

Add the MODULE_DEVICE_TABLE(of, ...) entry so modpost can generate OF
module aliases for OF based module autoloading.

Fixes: a79ac2cdc91d ("i3c: master: Add driver for Analog Devices I3C Controller IP")
Signed-off-by: Can Peng <pengcan@kylinos.cn>
---
 drivers/i3c/master/adi-i3c-master.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/i3c/master/adi-i3c-master.c b/drivers/i3c/master/adi-i3c-master.c
index e29aac286957..fb4cfc9026cc 100644
--- a/drivers/i3c/master/adi-i3c-master.c
+++ b/drivers/i3c/master/adi-i3c-master.c
@@ -929,6 +929,7 @@ static const struct of_device_id adi_i3c_master_of_match[] = {
 	{ .compatible = "adi,i3c-master-v1" },
 	{}
 };
+MODULE_DEVICE_TABLE(of, adi_i3c_master_of_match);
 
 static int adi_i3c_master_probe(struct platform_device *pdev)
 {
-- 
2.53.0


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
