Return-Path: <SRS0=dXGV=GD=lists.infradead.org=linux-i3c-bounces+linux-i3c=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 73100C433E9
	for <linux-i3c@archiver.kernel.org>; Thu, 31 Dec 2020 17:38:00 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 15F61223E4
	for <linux-i3c@archiver.kernel.org>; Thu, 31 Dec 2020 17:37:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 15F61223E4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=DBVOryJAI/QD9za0vmH8PhWdYTcNoTMBcViiocj1NTc=; b=APc1aKhYz55zRvABZYhUNzAfSO
	aaNgmiXcbAtD+2twEXKgq39wC+EwDysQZ9y2EjT0xxr2QHfh+p+NIhDJDSYwv2H9JX+S8Z1FsTN4+
	DHPtLguIGC0i5pjnFgUwOpQkMCBrnDkl5EVKbuMebRZuw0XfM3GzNrglq5v2FAr7d0fK0KqoM04QM
	UqVz+mDNTgHEY0eG4SQfrlmR9UvEyWC+OJqLUhXAVRf/a9o5SNB9eZWt3gNang1Db4T/+U2eeoL0k
	IK5cNywDmsaht3J88fQCj4puRVXlejGSvj9RMmMYqNzuxFHFYtzU4tkzjyXc5YZehVRB1U56JxC/B
	dSsFt3FA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kv1tf-0005gX-19; Thu, 31 Dec 2020 17:37:59 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kudd0-0004u6-Dd
 for linux-i3c@lists.infradead.org; Wed, 30 Dec 2020 15:43:11 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id CDD1F20725;
 Wed, 30 Dec 2020 15:43:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1609342989;
 bh=RgCdwo79oX9AX/HZWofDnlRT6UBxCbYnV4jmsyma3T0=;
 h=From:To:Cc:Subject:Date:From;
 b=bKxeAX1e8hMsEkf8JXE0A37wDH03wJp5JaovJSKjAWRe4aN+LrEsByQ6fKonOKlU8
 cwi4dSh/+alGMmflfVNrmQEblGwoVx9/6tsfcShwshV3HkuSkMtm0z179bTrFdnNjD
 xHgEtCvVvKkIlFiNkO1bkoBis1IFUQSN6Pt5oKn6QNcCPoAYtKy+zmKsXcxlEK86zY
 3oHoqTKIKOe2uEUG3N9qzp6wdck2QJ7tsPTQutUvpkMQgcA8bKYbBEr5Xtv8WweUwZ
 3vYtLnoUwRfFhJigeb55j9o2rg6AVZMoJyfHtPlarOthxdIhIPW0p6hi7+Hsy+y6wr
 g7Nn71Bn7VOnA==
From: Arnd Bergmann <arnd@kernel.org>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Nathan Chancellor <natechancellor@gmail.com>,
 Nick Desaulniers <ndesaulniers@google.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Nicolas Pitre <npitre@baylibre.com>
Subject: [PATCH] i3c/master/mipi-i3c-hci: re-fix __maybe_unused attribute
Date: Wed, 30 Dec 2020 16:42:50 +0100
Message-Id: <20201230154304.598900-1-arnd@kernel.org>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201230_104310_615909_38113890 
X-CRM114-Status: GOOD (  11.96  )
X-Mailman-Approved-At: Thu, 31 Dec 2020 12:37:56 -0500
X-BeenThere: linux-i3c@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-i3c.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-i3c>,
 <mailto:linux-i3c-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-i3c/>
List-Post: <mailto:linux-i3c@lists.infradead.org>
List-Help: <mailto:linux-i3c-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-i3c>,
 <mailto:linux-i3c-request@lists.infradead.org?subject=subscribe>
Cc: clang-built-linux@googlegroups.com, linux-i3c@lists.infradead.org,
 linux-kernel@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org

From: Arnd Bergmann <arnd@arndb.de>

clang warns because the added __maybe_unused attribute is in
the wrong place:

drivers/i3c/master/mipi-i3c-hci/core.c:780:21: error: attribute declaration must precede definition [-Werror,-Wignored-attributes]
static const struct __maybe_unused of_device_id i3c_hci_of_match[] = {
                    ^
include/linux/compiler_attributes.h:267:56: note: expanded

Fixes: 95393f3e07ab ("i3c/master/mipi-i3c-hci: quiet maybe-unused variable warning")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/i3c/master/mipi-i3c-hci/core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/i3c/master/mipi-i3c-hci/core.c b/drivers/i3c/master/mipi-i3c-hci/core.c
index 500abd27fb22..1b73647cc3b1 100644
--- a/drivers/i3c/master/mipi-i3c-hci/core.c
+++ b/drivers/i3c/master/mipi-i3c-hci/core.c
@@ -777,7 +777,7 @@ static int i3c_hci_remove(struct platform_device *pdev)
 	return 0;
 }
 
-static const struct __maybe_unused of_device_id i3c_hci_of_match[] = {
+static const __maybe_unused struct of_device_id i3c_hci_of_match[] = {
 	{ .compatible = "mipi-i3c-hci", },
 	{},
 };
-- 
2.29.2


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
