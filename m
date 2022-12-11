Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18FBDC4332F
	for <linux-i3c@archiver.kernel.org>; Sun, 11 Dec 2022 20:59:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=1mfen4zLBN0fX6WwWeaUCnQG1JNU/zScwQ5KlPe3TXM=; b=RyFLZWj3XgUoyS
	rMF9FaSpsPr1X2TUM0sJ/ck9ANM6xMgdnGjbKBj7WwqGtDNn1LB0NHpoKDYMHRHSZ1BvKic4yeqzw
	X16FwEnG6FLlCMHScNzNcwgSFJRrTPRksRzxWQ9GAk1OmWSnwQfKbQ7+oAUeSYzAPiHuSZMtWMSHv
	tgVuvYr0GnknzKCOJNjqQbfpCcTPSnScqzjTJOmerganV2BGeTAg2xqAbDqNC1Aj0B46BHxIkPWTW
	i8bnyTGtgLlwowlvlLayDXUgJgI9JNUlgFtZ7wY8+EE98A5767g1hf/qqqwCKDzVMRWG63XaNNwVz
	al5gIdJA/9AfaWmrQtng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p4TPY-004CbE-Sd; Sun, 11 Dec 2022 20:59:00 +0000
Received: from relay7-d.mail.gandi.net ([217.70.183.200])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p4TPV-004CW5-Rg
	for linux-i3c@lists.infradead.org; Sun, 11 Dec 2022 20:58:59 +0000
Received: (Authenticated sender: alexandre.belloni@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id A79D620003;
	Sun, 11 Dec 2022 20:58:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1670792334;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=OW+Jf3T9krEqob1pbgkYLip+2/YZDVH0nCzV5ngx3H4=;
	b=hSrfhxHpYnh6SR9rg0SK/FKC6cZs6qjSW5QNN8+nV9SsEncdePE8OBXOjFP6RdSxS/skqg
	3DQhmEiTgC+vDX83r7AHT4XPpeLAQMlxCtiGyNPiZJqPxKc/9+/xX8r/bGFIw0cH6/Baai
	1sPDKQucr8ywQ3ZKVlAeqUIdSt5ndsU/T05ZuMOD/z+Pdu63LhLalDrpZDT8qoD140k3ZX
	jGGQ+XD+o6BREzUStK+F0XIzAKmUuR+ezisOmm/77wM2rncQfv5cMax1DMTmH0SoUVvEvY
	O5Fmj4JDtPUdVgAl5lB6EXrjaClhpCyKkHn45jTD6h6iDdVK3ppzIOFvtYIcEA==
From: alexandre.belloni@bootlin.com
To: linux-i3c@lists.infradead.org
Cc: Vitor Soares <vitor.soares@synopsys.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH] MAINTAINERS: mark I3C DRIVER FOR SYNOPSYS DESIGNWARE orphan
Date: Sun, 11 Dec 2022 21:55:38 +0100
Message-Id: <20221211205539.19353-1-alexandre.belloni@bootlin.com>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221211_125858_205440_214D00FE 
X-CRM114-Status: UNSURE (   6.58  )
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

From: Alexandre Belloni <alexandre.belloni@bootlin.com>

Vitor left Synopsys and the email address is now bouncing.

Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
---
 MAINTAINERS | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index cf0f18502372..ebd7f7c957ea 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -9697,8 +9697,7 @@ F:	Documentation/devicetree/bindings/i3c/cdns,i3c-master.yaml
 F:	drivers/i3c/master/i3c-master-cdns.c
 
 I3C DRIVER FOR SYNOPSYS DESIGNWARE
-M:	Vitor Soares <vitor.soares@synopsys.com>
-S:	Maintained
+S:	Orphan
 F:	Documentation/devicetree/bindings/i3c/snps,dw-i3c-master.yaml
 F:	drivers/i3c/master/dw*
 
-- 
2.38.1


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
