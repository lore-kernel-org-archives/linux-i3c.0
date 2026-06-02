Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11C99CD6E5D
	for <linux-i3c@archiver.kernel.org>; Tue,  2 Jun 2026 11:49:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=X4/ECEefMHIn8BKTnVMoBkeUKgyvYFWqjw/EO0fJJ4w=; b=KWDy+DBzQvCL+L
	janlugtKiqVaFypvrmuShaKvd8rlzuJP8C1MFmaxseXMXa47AIAovZ4xcGWbnPMuyYhIjdZFDYhvo
	yxjFsCAQSCFb19h+6yhvC3l8NkVNLUoq3dwyKbmXm38G3AdfP9qQvg7vsSzOgfMTFer6RNU02DKyg
	hEbmDw+xxS0zh9XPsS/NGxoB7/A6UvwlenGSw8qXCdZHAs+L14FfmEtowz4YbLjehlLJeFClgKQ2N
	T/ev0mnLyhkv+svPugvi0+rjNACmmiByuaieXeuhkDOKcbzj0i2i+3fSceiEPAnDqQFGOocuFStyg
	mGrvvM1ehwwPdkSspx7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUNcY-0000000CucK-2ejn;
	Tue, 02 Jun 2026 11:49:22 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUNcV-0000000Cubl-3uIW
	for linux-i3c@lists.infradead.org;
	Tue, 02 Jun 2026 11:49:21 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 9F588416AB;
	Tue,  2 Jun 2026 11:49:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3587D1F00893;
	Tue,  2 Jun 2026 11:49:16 +0000 (UTC)
Message-ID: <343031b7-f011-4c27-a1d6-a84b31ab30ce@tuxon.dev>
Date: Tue, 2 Jun 2026 14:49:14 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 17/17] i3c: renesas: Add runtime PM support
To: Claudiu Beznea <claudiu.beznea@kernel.org>, Frank Li <Frank.li@nxp.com>
Cc: wsa+renesas@sang-engineering.com, tommaso.merciai.xr@bp.renesas.com,
 alexandre.belloni@bootlin.com, p.zabel@pengutronix.de,
 linux-i3c@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org,
 Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>,
 "geert+renesas@glider.be" <geert+renesas@glider.be>
References: <20260522101815.1722909-1-claudiu.beznea@kernel.org>
 <20260522101815.1722909-18-claudiu.beznea@kernel.org>
 <ahC2NfJl0bD1pFcX@lizhi-Precision-Tower-5810>
 <8f1cd05b-b866-47ac-8ef4-e5e607247cf7@kernel.org>
Content-Language: en-US
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <8f1cd05b-b866-47ac-8ef4-e5e607247cf7@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260602_044920_028381_7F3E9E98 
X-CRM114-Status: UNSURE (   5.63  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org

CgpPbiA1LzIzLzI2IDEzOjIzLCBDbGF1ZGl1IEJlem5lYSB3cm90ZToKPj4+ICvCoMKgwqAgaTNj
LT5kZXYgPSAmcGRldi0+ZGV2Owo+Pj4gK8KgwqDCoCBwbV9ydW50aW1lX3NldF9hdXRvc3VzcGVu
ZF9kZWxheSgmcGRldi0+ZGV2LCAzMDApOwo+Pj4gK8KgwqDCoCBwbV9ydW50aW1lX3VzZV9hdXRv
c3VzcGVuZCgmcGRldi0+ZGV2KTsKPj4+ICvCoMKgwqAgcmV0ID0gZGV2bV9hZGRfYWN0aW9uX29y
X3Jlc2V0KCZwZGV2LT5kZXYsIAo+Pj4gcmVuZXNhc19pM2NfZG9udF91c2VfYXV0b3N1c3BlbmQs
Cj4+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgaTNjLT5k
ZXYpOwo+Pgo+PiBkbyB5b3UgY2xlYW51cCByZXNvdXJjZSBpbiByZW5lc2FzX2kzY19kb250X3Vz
ZV9hdXRvc3VzcGVuZCgpLCBsb29rIGxpa2VzCj4+IG5lZWRuJ3QgaXQuCj4gCj4gQWNjb3JkaW5n
IHRvIGRvY3VtZW50YXRpb24gYXQgWzFdIHRoaXMgaXMgbmVjZXNzYXJ5Lgo+IAo+IFsxXSBodHRw
czovL2VsaXhpci5ib290bGluLmNvbS9saW51eC92Ny4xLXJjNC9zb3VyY2UvRG9jdW1lbnRhdGlv
bi9wb3dlci8gCj4gcnVudGltZV9wbS5yc3QjTDYxNgoKQWN0dWFsbHksIHRoZSBjbGVhbnVwIGhl
bHBlciBvZiBkZXZtX3BtX3J1bnRpbWVfZW5hYmxlKCkgdGFrZXMgY2FyZSBvZiB0aGlzLCAKdGh1
cyBJJ2xsIGJlIHJlbW92aW5nIHRoZSByZW5lc2FzX2kzY19kb250X3VzZV9hdXRvc3VzcGVuZCgp
LgoKVGhhbmsgeW91LApDbGF1ZGl1CgoKLS0gCmxpbnV4LWkzYyBtYWlsaW5nIGxpc3QKbGludXgt
aTNjQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1h
bi9saXN0aW5mby9saW51eC1pM2MK
