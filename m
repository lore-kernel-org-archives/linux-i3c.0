Return-Path: <SRS0=Xn1S=HD=lists.infradead.org=linux-i3c-bounces+linux-i3c=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6A77BC433E0
	for <linux-i3c@archiver.kernel.org>; Mon,  1 Feb 2021 23:17:33 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B1BBE64EAA
	for <linux-i3c@archiver.kernel.org>; Mon,  1 Feb 2021 23:17:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B1BBE64EAA
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=2TT04aKb1XVF4bwW067ZQeVI8PBYP6eCgpNw5d9fQRQ=; b=qIUJCQqu19kvd7FvlkKzN+oLc
	16Op8UkyD/IhnHFrkSdhVWlGQjNQfrsu5NrGgRdMSuIpWARogGUKi4d7LPtEexTPyRpAnOHHrlGy9
	KHUWOmGQ9rhKf2UtFJHutrXaYBK9n51IGO3kUXGvNJWOAiYslbyLHj1vE2XpTpyQh5Q1JR1loILqn
	ErYUiufGQLlwpOR1IRy/p6WAAIpuy5KxfZBrj7tbsGiGatYSF3Rb5icftvb2AlW+2L6Q9KrEA/HIV
	utKe+GEZF9cht3HwWgatBhdedYBUT/d/Vdidxb++5AB6yze6iLdRZQGn6xqVc7d5xbs3xkAIXNxSR
	zdLpWTVqg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l6iRn-0001OR-V9; Mon, 01 Feb 2021 23:17:31 +0000
Received: from relay2-d.mail.gandi.net ([217.70.183.194])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l6iRj-0001NF-Ve
 for linux-i3c@lists.infradead.org; Mon, 01 Feb 2021 23:17:29 +0000
X-Originating-IP: 86.202.109.140
Received: from localhost (lfbn-lyo-1-13-140.w86-202.abo.wanadoo.fr
 [86.202.109.140])
 (Authenticated sender: alexandre.belloni@bootlin.com)
 by relay2-d.mail.gandi.net (Postfix) with ESMTPSA id B439D40003;
 Mon,  1 Feb 2021 23:17:25 +0000 (UTC)
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Subject: Re: [PATCH 1/2] i3c: Handle drivers without probe or remove callback
Date: Tue,  2 Feb 2021 00:17:21 +0100
Message-Id: <161222143405.3432488.2548904901699225293.b4-ty@bootlin.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210128091048.17006-1-u.kleine-koenig@pengutronix.de>
References: <20210128091048.17006-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210201_181728_139548_36030DDC 
X-CRM114-Status: UNSURE (   7.38  )
X-CRM114-Notice: Please train this message.
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
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 linux-i3c@lists.infradead.org, linux-kernel@vger.kernel.org,
 kernel@pengutronix.de
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org

T24gVGh1LCAyOCBKYW4gMjAyMSAxMDoxMDo0NyArMDEwMCwgVXdlIEtsZWluZS1Lw7ZuaWcgd3Jv
dGU6Cj4gQSByZWdpc3RlcmVkIGRyaXZlciB3aXRob3V0IGEgcHJvYmUgY2FsbGJhY2sgZG9lc24n
dCBtYWtlIHNlbnNlLCBzbwo+IHJlZnVzZSB0byByZWdpc3RlciBzdWNoIGEgZHJpdmVyLiAoT3Ro
ZXJ3aXNlIGkzY19kZXZpY2VfcHJvYmUoKSB5aWVsZHMgYQo+IE5VTEwgcG9pbnRlciBleGNlcHRp
b24uKQo+IAo+IEEgZHJpdmVyIHdpdGhvdXQgcmVtb3ZlIGlzIHBvc3NpYmxlLCBlLmcuIHdoZW4g
YWxsIHJlc291cmNlcyBhcmUgZnJlZWQKPiB1c2luZyBkZXZtIGNhbGxiYWNrcy4gU28gZ3VhcmQg
dGhlIGNhbGwgdG8gZHJpdmVyLT5yZW1vdmUgYnkgYSBjaGVjawo+IGZvciBiZWluZyBub24tTlVM
TC4KPiAKPiBbLi4uXQoKQXBwbGllZCwgdGhhbmtzIQoKWzEvMl0gaTNjOiBIYW5kbGUgZHJpdmVy
cyB3aXRob3V0IHByb2JlIG9yIHJlbW92ZSBjYWxsYmFjawogICAgICBjb21taXQ6IDc0NTZmZWE1
ODljNmFkMzQyMmIwYzE4ODg3MWFlODBlMWQzMDc3MzcKWzIvMl0gaTNjOiBNYWtlIHJlbW92ZSBj
YWxsYmFjayByZXR1cm4gdm9pZAogICAgICBjb21taXQ6IGRkOTI2NzAzNGMwZTM2NGI0OTI2MWMz
ZTAwNzBiODYzMjg2ZDEyNDIKCkJlc3QgcmVnYXJkcywKLS0gCkFsZXhhbmRyZSBCZWxsb25pIDxh
bGV4YW5kcmUuYmVsbG9uaUBib290bGluLmNvbT4KCi0tIApsaW51eC1pM2MgbWFpbGluZyBsaXN0
CmxpbnV4LWkzY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3Jn
L21haWxtYW4vbGlzdGluZm8vbGludXgtaTNjCg==
