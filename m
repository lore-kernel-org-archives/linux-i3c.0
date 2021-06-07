Return-Path: <SRS0=hrBA=LB=lists.infradead.org=linux-i3c-bounces+linux-i3c=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_2 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4F9A2C47082
	for <linux-i3c@archiver.kernel.org>; Mon,  7 Jun 2021 06:23:06 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F3538611BD
	for <linux-i3c@archiver.kernel.org>; Mon,  7 Jun 2021 06:23:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F3538611BD
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bv1et/b3fYdOo7nUb4N7AT9ul3iNeBK+T8gvIHl5qyE=; b=RRa+BPcIdOqs/Q
	wAeNfF9XMdaMrHVYOtLYTzEv3UOTs6M0yywXo4au3yLmpbUURlTahpU5vGLpZkvWzKMi9LpJpv5wO
	q4NO4YP3AovMq6Ri1u+EFMA4iKWRefxMl1IsRc56zQMK7XoT9261YT+LB9su5Uz63R4pvyptktQs/
	m50GqOyjFj5mWqVtK6lK3ma2+4TCX+8YB09PZJX5iZGQtLAtFjvlzvWXtzT6YoMSFfF6AMnEaqLau
	zZKkFJizzlQMNBkVdXd3RqjGneSgtFULX66SSPkxp0LkmbqBemfBUhslHtdImD/nxuhx4dNdrL1kh
	XLwGn1w/vi2bxGXHtsZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lq8fA-001gYz-VF; Mon, 07 Jun 2021 06:23:04 +0000
Received: from relay7-d.mail.gandi.net ([217.70.183.200])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lq8f8-001gY6-UG
 for linux-i3c@lists.infradead.org; Mon, 07 Jun 2021 06:23:04 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by relay7-d.mail.gandi.net (Postfix) with ESMTPSA id A512C20002;
 Mon,  7 Jun 2021 06:22:56 +0000 (UTC)
Date: Mon, 7 Jun 2021 08:22:55 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Yang Yingliang <yangyingliang@huawei.com>
Cc: <linux-kernel@vger.kernel.org>, <linux-i3c@lists.infradead.org>,
 <alexandre.belloni@bootlin.com>
Subject: Re: [PATCH -next v2] i3c: master: svc: drop free_irq of
 devm_request_irq allocated irq
Message-ID: <20210607082255.5ab761b9@xps13>
In-Reply-To: <20210602084935.3977636-1-yangyingliang@huawei.com>
References: <20210602084935.3977636-1-yangyingliang@huawei.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.7 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210606_232303_130642_5BEC6460 
X-CRM114-Status: UNSURE (   5.34  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org

SGVsbG8sCgpZYW5nIFlpbmdsaWFuZyA8eWFuZ3lpbmdsaWFuZ0BodWF3ZWkuY29tPiB3cm90ZSBv
biBXZWQsIDIgSnVuIDIwMjEKMTY6NDk6MzUgKzA4MDA6Cgo+IGlycSBhbGxvY2F0ZWQgd2l0aCBk
ZXZtX3JlcXVlc3RfaXJxKCkgd2lsbCBiZSBmcmVlZCBpbiBkZXZtX2lycV9yZWxlYXNlKCksCj4g
dXNpbmcgZnJlZV9pcnEoKSBpbiAtPnJlbW92ZSgpIHdpbGwgY2F1c2VzIGEgZGFuZ2xpbmcgcG9p
bnRlciwgYW5kIGEKPiBzdWJzZXF1ZW50IGRvdWJsZSBmcmVlLiBTbyByZW1vdmUgdGhlIGZyZWVf
aXJxKCkgaW4gc3ZjX2kzY19tYXN0ZXJfcmVtb3ZlKCkuCj4gCj4gUmVwb3J0ZWQtYnk6IEh1bGsg
Um9ib3QgPGh1bGtjaUBodWF3ZWkuY29tPgo+IFNpZ25lZC1vZmYtYnk6IFlhbmcgWWluZ2xpYW5n
IDx5YW5neWluZ2xpYW5nQGh1YXdlaS5jb20+CgpSZXZpZXdlZC1ieTogTWlxdWVsIFJheW5hbCA8
bWlxdWVsLnJheW5hbEBib290bGluLmNvbT4KClRoYW5rcywKTWlxdcOobAoKLS0gCmxpbnV4LWkz
YyBtYWlsaW5nIGxpc3QKbGludXgtaTNjQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3Rz
LmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1pM2MK
