Return-Path: <SRS0=ezbp=IB=lists.infradead.org=linux-i3c-bounces+linux-i3c=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7249FC433DB
	for <linux-i3c@archiver.kernel.org>; Wed,  3 Mar 2021 17:09:49 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BB41764ED0
	for <linux-i3c@archiver.kernel.org>; Wed,  3 Mar 2021 17:09:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BB41764ED0
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=bWD5+rHiLD3qsZtpbB1QnYvPHdM7P0jOl/M2xT5ojBg=; b=hIoRFBmS100jRf5h6EPC//5eH
	aBAsFFPJPVqDTdmLi2gNN5kh6QSR7o6S6dsxlr+n0tWdK9rSaiYr9lFp0tTqNSw8OJ5nP4ei4zSTW
	MjrfCAI+IsKDxYgE94NCnvFi+ooO56uVDD7FT04LE2zEHEuLGyLG7zrYEW6jfmVMNize1BGddoROb
	3kbbJRfiUoh0l0ToGC7gKKfbTaAxNsPztMT9c2GIBNVvjh10ACwVFJKQ7YqHEYnuCrdsH0VHemIC9
	9amah5r1xV66a4dkB3nbTGYvGyV0I9JOxom6ByCm86ztChNqP+r2Vr+4Dq7tQuJqAi8UnM9u+WjtV
	FsGpgYb6g==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lHV0K-005jqc-RT; Wed, 03 Mar 2021 17:09:44 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lHSt1-005Etb-He
 for linux-i3c@desiato.infradead.org; Wed, 03 Mar 2021 14:54:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
 MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Sender
 :Reply-To:Content-ID:Content-Description;
 bh=oyUSphXsjB1G5Im3X+rSqRmsPqRDPGVbOVPk7gpBBhE=; b=grVgeAq5WbTR9uGjs+LoN9+bmR
 1nKJsYTLkyUVWY5RJPa9nyTKjZ1nbaIgW1GA+ja2PArLWTwIEUPiOUdWbmtixg3oIviVjFQJfGY30
 rPCcRq5kuK5Ve1EFsGDFEYT5t7eFuePA0n1HmL+E7cvoicKkRJ7sZnUFK8HL+2dyhq6SCefEyC159
 af6G71LK/0+UBDAe/VUgUujVrzqjtTiY1wea6FDVUTl+qecKxfkuJ0OiQ782mfQCaKDbgQqBlvymQ
 dWd8ddGKpMVKkId7t1hchM0XF+/TP7aDTBR5VeNP9gcb6u8lasD0QCKXoAwrtJgCs/fy6U7XDXdr2
 KgS0lyPg==;
Received: from relay6-d.mail.gandi.net ([217.70.183.198])
 by casper.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lH6Jh-00HHw9-M2
 for linux-i3c@lists.infradead.org; Tue, 02 Mar 2021 14:48:19 +0000
X-Originating-IP: 86.206.8.148
Received: from xps13 (lfbn-tou-1-491-148.w86-206.abo.wanadoo.fr [86.206.8.148])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay6-d.mail.gandi.net (Postfix) with ESMTPSA id 1F8F2C000E;
 Tue,  2 Mar 2021 14:47:39 +0000 (UTC)
Date: Tue, 2 Mar 2021 15:47:38 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Colin King <colin.king@canonical.com>
Cc: Conor Culhane <conor.culhane@silvaco.com>, Alexandre Belloni
 <alexandre.belloni@bootlin.com>, linux-i3c@lists.infradead.org,
 kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH][next] i3c: master: svc: remove redundant assignment to
 cmd->read_len
Message-ID: <20210302154739.00cd4a22@xps13>
In-Reply-To: <20210224151349.202332-1-colin.king@canonical.com>
References: <20210224151349.202332-1-colin.king@canonical.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210302_144819_416448_1184381E 
X-CRM114-Status: GOOD (  11.54  )
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

CkNvbGluIEtpbmcgPGNvbGluLmtpbmdAY2Fub25pY2FsLmNvbT4gd3JvdGUgb24gV2VkLCAyNCBG
ZWIgMjAyMQoxNToxMzo0OSArMDAwMDoKCj4gRnJvbTogQ29saW4gSWFuIEtpbmcgPGNvbGluLmtp
bmdAY2Fub25pY2FsLmNvbT4KPiAKPiBUaGUgYXNzaWdubWVudCBvZiB4ZmVyX2xlbiB0byBjbWQt
PnJlYWRfbGVuIGFwcGVhcnMgdG8gYmUgcmVkdW5kYW50Cj4gYXMgdGhlIG5leHQgc3RhdGVtZW50
IHJlLWFzc2lnbnMgdGhlIHZhbHVlIDAgdG8gaXQuICBDbGVhbiB1cCB0aGUKPiBjb2RlIGJ5IHJl
bW92aW5nIHRoZSByZWR1bmRhbnQgZmlyc3QgYXNzaWdubWVudC4KPiAKPiBBZGRyZXNzZXMtQ292
ZXJpdHk6ICgiVW51c2VkIHZhbHVlIikKPiBGaXhlczogZGQzYzUyODQ2ZDU5ICgiaTNjOiBtYXN0
ZXI6IHN2YzogQWRkIFNpbHZhY28gSTNDIG1hc3RlciBkcml2ZXIiKQo+IFNpZ25lZC1vZmYtYnk6
IENvbGluIElhbiBLaW5nIDxjb2xpbi5raW5nQGNhbm9uaWNhbC5jb20+Cj4gLS0tCj4gIGRyaXZl
cnMvaTNjL21hc3Rlci9zdmMtaTNjLW1hc3Rlci5jIHwgMSAtCj4gIDEgZmlsZSBjaGFuZ2VkLCAx
IGRlbGV0aW9uKC0pCj4gCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvaTNjL21hc3Rlci9zdmMtaTNj
LW1hc3Rlci5jIGIvZHJpdmVycy9pM2MvbWFzdGVyL3N2Yy1pM2MtbWFzdGVyLmMKPiBpbmRleCA4
ZDk5MDY5NjY3NmUuLjFmNmJhNDIyMTgxNyAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2kzYy9tYXN0
ZXIvc3ZjLWkzYy1tYXN0ZXIuYwo+ICsrKyBiL2RyaXZlcnMvaTNjL21hc3Rlci9zdmMtaTNjLW1h
c3Rlci5jCj4gQEAgLTExMjQsNyArMTEyNCw2IEBAIHN0YXRpYyBpbnQgc3ZjX2kzY19tYXN0ZXJf
c2VuZF9kaXJlY3RfY2NjX2NtZChzdHJ1Y3Qgc3ZjX2kzY19tYXN0ZXIgKm1hc3RlciwKPiAgCWNt
ZC0+aW4gPSBOVUxMOwo+ICAJY21kLT5vdXQgPSAmY2NjLT5pZDsKPiAgCWNtZC0+bGVuID0gMTsK
PiAtCWNtZC0+cmVhZF9sZW4gPSB4ZmVyX2xlbjsKPiAgCWNtZC0+cmVhZF9sZW4gPSAwOwo+ICAJ
Y21kLT5jb250aW51ZWQgPSB0cnVlOwo+ICAKClJldmlld2VkLWJ5OiBNaXF1ZWwgUmF5bmFsIDxt
aXF1ZWwucmF5bmFsQGJvb3RsaW4uY29tPgoKVGhhbmtzLApNaXF1w6hsCgotLSAKbGludXgtaTNj
IG1haWxpbmcgbGlzdApsaW51eC1pM2NAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMu
aW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWkzYwo=
