Return-Path: <SRS0=NTCG=AY=lists.infradead.org=linux-i3c-bounces+linux-i3c=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 59C0CC433E7
	for <linux-i3c@archiver.kernel.org>; Mon, 13 Jul 2020 15:29:51 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2D09F206F0
	for <linux-i3c@archiver.kernel.org>; Mon, 13 Jul 2020 15:29:51 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="LAsJqVoi"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2D09F206F0
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=al2klimov.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=hdKzEXofRDp0pViZku5VbaWmwDBBVuaOe7euQHl1iY0=; b=LAsJqVoi3VTioLys0pKUhoeiT7
	TwGWHadM83kYaNl/5u/r4yWdL5mCLbE2Zfcg7Y2MLcn5nlYfprnXCjC8yl018eVfy1L7p18cfFTw8
	ea3UzK7EadgKhMX8ya95bvp3+PuIxdmqKV5q4q5GWWCUL4CWbZ8Ej5R8X2qMnFo9izqXaXwveOaXy
	7w0Or2ZlpNqGnx38fnKBwxxDJ4v56NynqxFKIBfv9t5e7rg7aeYxqTnhI6bOFtZFw9DlbauEBFuM0
	bTE93QY3U2/gtquFR2WSQAv+5Fcq+nQQmNgokHjbi0hwZ9/Ib2ijZnzgUEFny+0UO/U59Ytmqr0qH
	pcUNRiXA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jv0Os-0003iP-JU
	for linux-i3c@archiver.kernel.org; Mon, 13 Jul 2020 15:29:50 +0000
Received: from smtp.al2klimov.de ([2a01:4f8:c0c:1465::1])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1juwby-0001i0-EV
 for linux-i3c@lists.infradead.org; Mon, 13 Jul 2020 11:27:07 +0000
Received: from authenticated-user (PRIMARY_HOSTNAME [PUBLIC_IP])
 by smtp.al2klimov.de (Postfix) with ESMTPA id 653FEBC069;
 Mon, 13 Jul 2020 11:27:03 +0000 (UTC)
From: "Alexander A. Klimov" <grandmaster@al2klimov.de>
To: bbrezillon@kernel.org, corbet@lwn.net, linux-i3c@lists.infradead.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] docs: driver-api: i3c: Replace HTTP links with HTTPS ones
Date: Mon, 13 Jul 2020 13:26:57 +0200
Message-Id: <20200713112657.33694-1-grandmaster@al2klimov.de>
MIME-Version: 1.0
X-Spamd-Bar: +++++
Authentication-Results: smtp.al2klimov.de;
 auth=pass smtp.auth=aklimov@al2klimov.de
 smtp.mailfrom=grandmaster@al2klimov.de
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200713_072706_657088_ABCBFB21 
X-CRM114-Status: UNSURE (   7.80  )
X-CRM114-Notice: Please train this message.
X-Mailman-Approved-At: Mon, 13 Jul 2020 11:29:49 -0400
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
Cc: "Alexander A. Klimov" <grandmaster@al2klimov.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org

Rationale:
Reduces attack surface on kernel devs opening the links for MITM
as HTTPS traffic is much harder to manipulate.

Deterministic algorithm:
For each file:
  If not .svg:
    For each line:
      If doesn't contain `\bxmlns\b`:
        For each link, `\bhttp://[^# \t\r\n]*(?:\w|/)`:
	  If neither `\bgnu\.org/license`, nor `\bmozilla\.org/MPL\b`:
            If both the HTTP and HTTPS versions
            return 200 OK and serve the same content:
              Replace HTTP with HTTPS.

Signed-off-by: Alexander A. Klimov <grandmaster@al2klimov.de>
---
 Continuing my work started at 93431e0607e5.
 See also: git log --oneline '--author=Alexander A. Klimov <grandmaster@al2klimov.de>' v5.7..master
 (Actually letting a shell for loop submit all this stuff for me.)

 If there are any URLs to be removed completely or at least not just HTTPSified:
 Just clearly say so and I'll *undo my change*.
 See also: https://lkml.org/lkml/2020/6/27/64

 If there are any valid, but yet not changed URLs:
 See: https://lkml.org/lkml/2020/6/26/837

 If you apply the patch, please let me know.

 Sorry again to all maintainers who complained about subject lines.
 Now I realized that you want an actually perfect prefixes,
 not just subsystem ones.
 I tried my best...
 And yes, *I could* (at least half-)automate it.
 Impossible is nothing! :)


 Documentation/driver-api/i3c/protocol.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/driver-api/i3c/protocol.rst b/Documentation/driver-api/i3c/protocol.rst
index dae3b6d32c6b..02653defa011 100644
--- a/Documentation/driver-api/i3c/protocol.rst
+++ b/Documentation/driver-api/i3c/protocol.rst
@@ -14,7 +14,7 @@ collisions are prevented, ...) please have a look at the I3C specification.
 This document is just a brief introduction to the I3C protocol and the concepts
 it brings to the table. If you need more information, please refer to the MIPI
 I3C specification (can be downloaded here
-http://resources.mipi.org/mipi-i3c-v1-download).
+https://resources.mipi.org/mipi-i3c-v1-download).
 
 Introduction
 ============
-- 
2.27.0


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
