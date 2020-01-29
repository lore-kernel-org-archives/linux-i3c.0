Return-Path: <SRS0=sARy=3U=lists.infradead.org=linux-i3c-bounces+linux-i3c=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,URIBL_DBL_ABUSE_MALW,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6B939C35240
	for <linux-i3c@archiver.kernel.org>; Fri, 31 Jan 2020 12:24:40 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3776B214D8
	for <linux-i3c@archiver.kernel.org>; Fri, 31 Jan 2020 12:24:40 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Y4xwjKPH";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="CPsUPWMz"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3776B214D8
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=synopsys.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=qmysPcZWvX26HHLrUFn3NBd9q8swgo7L8zKIrJBg7Xc=; b=Y4xwjKPHs2Hf1Ae4cec1Ozxia+
	dNpw5RUjdhY8fmg1GGlzZxQD3LVwWX0S2NSHlA2mQ20mSqLenoYagCxC9xspstxnbFg6jcLkszM40
	rKzzwPnLPNeEofEfOTatGPkcP0Ex5hrGNCTqZeldy4xwgEYlmY8hYyT9qTnK+aqscO8EM2QtUy+OF
	YQ2HzBUYuajj5FDugDJiUugOtoC/Iia4gVFN9xOYpfUIFutFM56a9bztRsZKm3W43suk5oW1qqYmb
	hWBEcw0648Z7O7Tuofshi6ZWWAyiA0B9Ve544IT5J+d3IeUr9xFxmENK6H3HDZR2UKnhp5I5W9lpm
	GaTRzYdw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ixVLj-0006Br-BB; Fri, 31 Jan 2020 12:24:39 +0000
Received: from smtprelay-out1.synopsys.com ([149.117.73.133])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iwmHv-0001Cs-Va
 for linux-i3c@lists.infradead.org; Wed, 29 Jan 2020 12:17:45 +0000
Received: from mailhost.synopsys.com (mdc-mailhost2.synopsys.com
 [10.225.0.210])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 5153840815;
 Wed, 29 Jan 2020 12:17:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1580300261; bh=K88LGp8ZZ8Fu0cHBIBDPPK01UKDCYDHLXwJ/DHIVegI=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:In-Reply-To:
 References:From;
 b=CPsUPWMzXwUCZ5BpimbxVuDIa5IbLBRG2JCEYZUgrTghqH6NIk3fgOFyAQeHvAPga
 1vVEu2O6Qawai4ovM36+9tplsguQIdbbiRzVib0YFlERPQxwCUsn7I+AoCF/HlvIUN
 igmkP7F+cMVLfmkBBlEWj3OngIzpG2j28uIKD+x/40uT1AEaI0UxwoQTGAj7Trw8SB
 52WhAH52s8rMXza62ZSo36pKArspgHsPoR5zwIer1wSPzQ8661EgmkXWJOdJt4KZ/J
 +De2rDAe2DAJLFPsKCsaTaPg2AyxTh2N1b+R4sEq2o1X/eX0dmSqdxuXmKs+u0v94b
 WJ4grjOBWcKdQ==
Received: from de02.synopsys.com (de02.internal.synopsys.com [10.225.17.21])
 by mailhost.synopsys.com (Postfix) with ESMTP id 5DF3AA0074;
 Wed, 29 Jan 2020 12:17:38 +0000 (UTC)
Received: from de02dwia024.internal.synopsys.com
 (de02dwia024.internal.synopsys.com [10.225.19.81])
 by de02.synopsys.com (Postfix) with ESMTP id 447653F039;
 Wed, 29 Jan 2020 13:17:38 +0100 (CET)
From: Vitor Soares <Vitor.Soares@synopsys.com>
To: linux-kernel@vger.kernel.org,
	linux-i3c@lists.infradead.org
Subject: [RFC v2 2/4] i3c: master: export i3c_bus_type symbol
Date: Wed, 29 Jan 2020 13:17:33 +0100
Message-Id: <449db711a8174934e078f90b21c31b683d11da8c.1580299067.git.vitor.soares@synopsys.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1580299067.git.vitor.soares@synopsys.com>
References: <cover.1580299067.git.vitor.soares@synopsys.com>
In-Reply-To: <cover.1580299067.git.vitor.soares@synopsys.com>
References: <cover.1580299067.git.vitor.soares@synopsys.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200129_041744_018922_37BA5F60 
X-CRM114-Status: UNSURE (   8.80  )
X-CRM114-Notice: Please train this message.
X-Mailman-Approved-At: Fri, 31 Jan 2020 04:24:38 -0800
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
Cc: Jose.Abreu@synopsys.com, Joao.Pinto@synopsys.com, arnd@arndb.de,
 wsa@the-dreams.de, gregkh@linuxfoundation.org, bbrezillon@kernel.org,
 Vitor Soares <Vitor.Soares@synopsys.com>, broonie@kernel.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org

Export i3c_bus_type symbol so i3cdev can register a notifier chain
for i3c bus.

Signed-off-by: Vitor Soares <vitor.soares@synopsys.com>
---
 drivers/i3c/master.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/i3c/master.c b/drivers/i3c/master.c
index 8a0ba34..21c4372 100644
--- a/drivers/i3c/master.c
+++ b/drivers/i3c/master.c
@@ -321,6 +321,7 @@ struct bus_type i3c_bus_type = {
 	.probe = i3c_device_probe,
 	.remove = i3c_device_remove,
 };
+EXPORT_SYMBOL_GPL(i3c_bus_type);
 
 static enum i3c_addr_slot_status
 i3c_bus_get_addr_slot_status(struct i3c_bus *bus, u16 addr)
-- 
2.7.4


_______________________________________________
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
