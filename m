Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 777C7C433F5
	for <linux-i3c@archiver.kernel.org>; Mon,  9 May 2022 13:22:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=06yAXlP8WBh8dozRjjRP4oN1Ut5XdtSpI7dT8+17POQ=; b=zaLX1/u7wJ9U4n
	zpYvjUDaXzaQ3RlGp8T22gLorcuyjODPrjJc0oFpRwq48bl2oLrAvAQMGAOfI++B+wsenXjnPaifg
	3R5rBcEfSdct2Gc6hiIv3q3Fl7At3cm9M6ZisMz/BRheyS8m/xa7T62g3osBQ5EsELP+t8iUZdMAS
	8Fd6tI61o1nuwn7sZ8vqdnOl7503kynfUo9qtWdlpMQq7sqiplet3pmg1RKp8NrdlqnQw1lD1GZeC
	vC8noyu4wT9hrePS7keeok3iGMiawagMyYXC6k07wZcWR/etjvBoYuqCZmjukDVJfu6Y5TPSGgvsC
	TIcdKGGZc4hO+Q0sOB1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1no3L6-00EXfU-Qv; Mon, 09 May 2022 13:22:16 +0000
Received: from relay9-d.mail.gandi.net ([217.70.183.199])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1no3L3-00EXed-3k
 for linux-i3c@lists.infradead.org; Mon, 09 May 2022 13:22:14 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 09BA9FF80B;
 Mon,  9 May 2022 13:22:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1652102527;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hYp7UicfNVk2h+W1pXimL0ouEnlIcPeVZRFiE+KGNmw=;
 b=DsCwXUrGLw7y5zT5ouJuJWAeYpKIYpXbGHRDWJA7femeBQDHbG38oetPYUw3F00wlrT5hA
 VcQrgquobqCorxlWCNKgeTRDf+N++i8i3lqwcMvz+tZ4ftG95MIW5eW6yblJgbEye4wQq5
 xsFNvm4q7vlBhJIa78qcUFtPBVV+TEyQr0FU6Av4X/xlUOFotnoPOtbX5HnfWxmu99UD08
 7X0m3XpmJh1j9FLBPeEJzhA4UW206mGQGN8CZbu7XrhnCkvBAwZXagc5QgnfbmMTqKNNF9
 /OR3WM4s8BomEyozov5Ah8lQHad3DKQTwCw2je9wtvGRsaJm1qCmXeQUB2Tjkw==
Date: Mon, 9 May 2022 15:22:05 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Guo Zhengkui <guozhengkui@vivo.com>
Cc: Conor Culhane <conor.culhane@silvaco.com>, Alexandre Belloni
 <alexandre.belloni@bootlin.com>, linux-i3c@lists.infradead.org,
 linux-kernel@vger.kernel.org, zhengkui_guo@outlook.com
Subject: Re: [PATCH] i3c: master: svc: fix returnvar.cocci warning
Message-ID: <20220509152205.5e6432e1@xps13>
In-Reply-To: <20220504164901.9622-1-guozhengkui@vivo.com>
References: <20220504164901.9622-1-guozhengkui@vivo.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.7 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220509_062213_324049_BC38BB15 
X-CRM114-Status: GOOD (  13.43  )
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

SGksCgpndW96aGVuZ2t1aUB2aXZvLmNvbSB3cm90ZSBvbiBUaHUsICA1IE1heSAyMDIyIDAwOjQ5
OjAxICswODAwOgoKPiBGaXggdGhlIGZvbGxvd2luZyBjb2NjaWNoZWNrIHdhcm5pbmc6Cj4gCj4g
ZHJpdmVycy9pM2MvbWFzdGVyL3N2Yy1pM2MtbWFzdGVyLmM6MTYwMDo1LTg6Cj4gVW5uZWVkZWQg
dmFyaWFibGU6ICJyZXQiLiBSZXR1cm4gIjAiIG9uIGxpbmUgMTYwNS4KPiAKPiBTaWduZWQtb2Zm
LWJ5OiBHdW8gWmhlbmdrdWkgPGd1b3poZW5na3VpQHZpdm8uY29tPgo+IC0tLQo+ICBkcml2ZXJz
L2kzYy9tYXN0ZXIvc3ZjLWkzYy1tYXN0ZXIuYyB8IDMgKy0tCj4gIDEgZmlsZSBjaGFuZ2VkLCAx
IGluc2VydGlvbigrKSwgMiBkZWxldGlvbnMoLSkKPiAKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9p
M2MvbWFzdGVyL3N2Yy1pM2MtbWFzdGVyLmMgYi9kcml2ZXJzL2kzYy9tYXN0ZXIvc3ZjLWkzYy1t
YXN0ZXIuYwo+IGluZGV4IDc1NTBkYWQ2NGVjZi4uZDZlOWVkNzRjZGNmIDEwMDY0NAo+IC0tLSBh
L2RyaXZlcnMvaTNjL21hc3Rlci9zdmMtaTNjLW1hc3Rlci5jCj4gKysrIGIvZHJpdmVycy9pM2Mv
bWFzdGVyL3N2Yy1pM2MtbWFzdGVyLmMKPiBAQCAtMTU5NywxMiArMTU5NywxMSBAQCBzdGF0aWMg
aW50IF9fbWF5YmVfdW51c2VkIHN2Y19pM2NfcnVudGltZV9zdXNwZW5kKHN0cnVjdCBkZXZpY2Ug
KmRldikKPiAgc3RhdGljIGludCBfX21heWJlX3VudXNlZCBzdmNfaTNjX3J1bnRpbWVfcmVzdW1l
KHN0cnVjdCBkZXZpY2UgKmRldikKPiAgewo+ICAJc3RydWN0IHN2Y19pM2NfbWFzdGVyICptYXN0
ZXIgPSBkZXZfZ2V0X2RydmRhdGEoZGV2KTsKPiAtCWludCByZXQgPSAwOwo+ICAKPiAgCXBpbmN0
cmxfcG1fc2VsZWN0X2RlZmF1bHRfc3RhdGUoZGV2KTsKPiAgCXN2Y19pM2NfbWFzdGVyX3ByZXBh
cmVfY2xrcyhtYXN0ZXIpOwo+ICAKPiAtCXJldHVybiByZXQ7Cj4gKwlyZXR1cm4gMDsKPiAgfQo+
ICAKPiAgc3RhdGljIGNvbnN0IHN0cnVjdCBkZXZfcG1fb3BzIHN2Y19pM2NfcG1fb3BzID0gewoK
UmV2aWV3ZWQtYnk6IE1pcXVlbCBSYXluYWwgPG1pcXVlbC5yYXluYWxAYm9vdGxpbi5jb20+CgpU
aGFua3MsCk1pcXXDqGwKCi0tIApsaW51eC1pM2MgbWFpbGluZyBsaXN0CmxpbnV4LWkzY0BsaXN0
cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGlu
Zm8vbGludXgtaTNjCg==
