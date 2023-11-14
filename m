Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05623C4167B
	for <linux-i3c@archiver.kernel.org>; Tue, 14 Nov 2023 08:43:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6zTItkHmAbRML4GbLsBP4cD7CzzXq1SaFDTyKaP1mm0=; b=zzrlIQJy1npTaY
	Y+HUCUT9nyf+d2ICihz35gB69E/HYLys0rbUG/93mx5mV1IrcKWdxselVJXPsHx9rDpm6GI8vHwEJ
	WGK7n6ES8l3SsxdUt72+eJ7K7BHObEOnkkIlK4n70ge9mQTkmiHo/zN5LI3ePOFaBB0Eda7AkXYke
	Itj93CIpdwmFPMKLYuCrTVWCpW8jkKZdP6T7n1XamTj+ZxSanir7D48xCiTT5fFtUUhtJ5LVV1F0K
	Q8S0iukfUU8ZvWC/56Eq7XvRyxUBqNugRVOv/Rr/AgIYNjFVn4qKANnATf6pc9j955fQdJEPZDGdi
	CZMaPXseEpKJszGTcoqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r2p0u-00FPbG-1Y;
	Tue, 14 Nov 2023 08:43:16 +0000
Received: from ex01.ufhost.com ([61.152.239.75])
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r2p0r-00FPaE-0I
	for linux-i3c@lists.infradead.org;
	Tue, 14 Nov 2023 08:43:15 +0000
Received: from EXMBX166.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX166", Issuer "EXMBX166" (not verified))
	by ex01.ufhost.com (Postfix) with ESMTP id C888C24E249;
	Tue, 14 Nov 2023 16:42:46 +0800 (CST)
Received: from EXMBX066.cuchost.com (172.16.7.66) by EXMBX166.cuchost.com
 (172.16.6.76) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Tue, 14 Nov
 2023 16:42:46 +0800
Received: from [192.168.100.10] (172.16.6.8) by EXMBX066.cuchost.com
 (172.16.6.66) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Tue, 14 Nov
 2023 16:42:45 +0800
Message-ID: <d0e473f3-7b05-2d18-9874-eb9fe26f8478@starfivetech.com>
Date: Tue, 14 Nov 2023 16:42:44 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v2 1/1] i3c: Add fallback method for GETMXDS CCC
Content-Language: en-US
To: Miquel Raynal <miquel.raynal@bootlin.com>
CC: <alexandre.belloni@bootlin.com>, <linux-i3c@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>
References: <20231114033430.9623-1-joshua.yeong@starfivetech.com>
 <20231114033430.9623-2-joshua.yeong@starfivetech.com>
 <20231114091956.0b8dd6c5@xps-13>
From: Joshua Yeong <joshua.yeong@starfivetech.com>
In-Reply-To: <20231114091956.0b8dd6c5@xps-13>
X-Originating-IP: [172.16.6.8]
X-ClientProxiedBy: EXCAS081.cuchost.com (172.16.6.41) To EXMBX066.cuchost.com
 (172.16.6.66)
X-YovoleRuleAgent: yovoleflag
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231114_004313_273105_E047BDC0 
X-CRM114-Status: GOOD (  20.53  )
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

SGkgTWlxdWVsLAoKT24gMTQtTm92LTIzIDQ6MTkgUE0sIE1pcXVlbCBSYXluYWwgd3JvdGU6Cj4g
SGkgSm9zaHVhLAo+Cj4gam9zaHVhLnllb25nQHN0YXJmaXZldGVjaC5jb20gd3JvdGUgb24gVHVl
LCAxNCBOb3YgMjAyMyAxMTozNDozMCArMDgwMDoKPgo+PiBTb21lIEkzQyBoYXJkd2FyZSB3aWxs
IHJlcG9ydCBlcnJvciB3aGVuIGluY29ycmVjdCBsZW5ndGggaXMgcmVjZWl2ZWQgZnJvbQo+IAkJ
CQkJYW4KPgo+PiBkZXZpY2UuIEdFVE1YRFMgQ0NDIGFyZSBhdmFpbGJsZSBpbiAyIGZvcm1hdHM7
IHdpdGhvdXQgdHVybmFyb3VuZCB0aW1lIChmb3JtYXQKPiAJCQkgIGF2YWlsYWJsZQkJOgo+Cj4+
IDEpIGFuZCB3aXRoIHR1cm5hcm91bmQgdGltZSAoZm9ybWF0IDIpLiBUaGVyZSBpcyBubyBtZWNo
YW5pY3MgdG8gZGV0ZXJtaW5lIHdoaWNoCj4+IGZvcm1hdCBpcyBzdXBwb3J0ZWQgYnkgZGV2aWNl
LiBJbiBjYXNlIHNlbmRpbmcgR0VUTVhEUyBDQ0MgZm9ybWF0IDIgcmVzdWx0ZWQKPiAJCQkJU28g
aW4gY2FzZT8KPgo+PiBmYWlsdXJlLCB0cnkgc2VuZGluZyBHRVRNWERTIENDQyBmb3JtYXQgMSBp
bnN0ZWFkLgo+IGluIGEKPgo+PiBTaWduZWQtb2ZmLWJ5OiBKb3NodWEgWWVvbmcgPGpvc2h1YS55
ZW9uZ0BzdGFyZml2ZXRlY2guY29tPgo+PiAtLS0KPj4gICBkcml2ZXJzL2kzYy9tYXN0ZXIuYyB8
IDEyICsrKysrKysrKystLQo+PiAgIDEgZmlsZSBjaGFuZ2VkLCAxMCBpbnNlcnRpb25zKCspLCAy
IGRlbGV0aW9ucygtKQo+Pgo+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9pM2MvbWFzdGVyLmMgYi9k
cml2ZXJzL2kzYy9tYXN0ZXIuYwo+PiBpbmRleCAwY2RjOTRlNGNiNzcuLjJmYzA0ZDk3ZjA3ZSAx
MDA2NDQKPj4gLS0tIGEvZHJpdmVycy9pM2MvbWFzdGVyLmMKPj4gKysrIGIvZHJpdmVycy9pM2Mv
bWFzdGVyLmMKPj4gQEAgLTEwOTksOCArMTA5OSwxNiBAQCBzdGF0aWMgaW50IGkzY19tYXN0ZXJf
Z2V0bXhkc19sb2NrZWQoc3RydWN0IGkzY19tYXN0ZXJfY29udHJvbGxlciAqbWFzdGVyLAo+PiAg
IAo+PiAgIAlpM2NfY2NjX2NtZF9pbml0KCZjbWQsIHRydWUsIEkzQ19DQ0NfR0VUTVhEUywgJmRl
c3QsIDEpOwo+PiAgIAlyZXQgPSBpM2NfbWFzdGVyX3NlbmRfY2NjX2NtZF9sb2NrZWQobWFzdGVy
LCAmY21kKTsKPj4gLQlpZiAocmV0KQo+PiAtCQlnb3RvIG91dDsKPj4gKwlpZiAocmV0KSB7Cj4+
ICsJCS8qCj4gCQkgXgo+IFdyb25nIGFsaWdubWVudCBvZiB0aGUgc3RhcnRzIGJlbG93Cj4gCQl2
Cj4+ICsJCSogUmV0cnkgd2hlbiB0aGUgZGV2aWNlIGRvZXMgbm90IHN1cHBvcnQgbWF4IHJlYWQg
dHVybmFyb3VuZAo+PiArCQkqIHdoaWxlIGV4cGVjdGluZyBzaG9ydGVyIGxlbmd0aCBmcm9tIHRo
aXMgQ0NDIGNvbW1hbmQKPiBwZXJpb2Q/Cj4KPj4gKwkJKi8KPj4gKwkJZGVzdC0+cGF5bG9hZC5s
ZW4gLT0gMzsKPj4gKwkJcmV0ID0gaTNjX21hc3Rlcl9zZW5kX2NjY19jbWRfbG9ja2VkKG1hc3Rl
ciwgJmNtZCk7Cj4+ICsJCWlmIChyZXQpCj4+ICsJCQlnb3RvIG91dDsKPj4gKwl9Cj4gSSBiZWxp
ZXZlIHRoaXMgaXMgYSBwZXItZGV2aWNlIGNvbmZpZ3VyYXRpb24gYW5kIHdlIHNob3VsZCBzYXZl
IHRoaXMgaW4KPiBvcmRlciB0byBvbmx5IGZhaWwgb25jZSwgbm8/CgpUaGlzIGJlaGF2aW9yIGRl
cGVuZHMgb24gdGhlIGhhcmR3YXJlIGRlc2lnbmVkIHdoZXRoZXIgaXQgd2lsbCByZXR1cm4gYW4g
CmVycm9yCmluIGNhc2Ugb2Ygc2hvcnRlciBsZW5ndGggZnJvbSBpM2MgZGV2aWNlcyBpbiBkZXN0
LT5wYXlsb2FkLmxlbi4gSSBtYWRlIAppdCBzbyBpdAp3aWxsIHJldHJ5IGJ5IGV4cGVjdGluZyBh
IHNob3J0ZXIgbGVuZ3RoIGluc3RlYWQsIGluIGNhc2UgaXQgc3RpbGwgZmFpbHMgCnRoZW4KaXQg
bWVhbnMgR0VUTVhEUyBDQ0MgcmVhbGx5IGZhaWxlZC4KCldlIGRvIG5vdCBoYXZlIHRvIGluaXRp
YWxpemUgdGhlIHNhbWUgaGFyZHdhcmUgdHdpY2UgYW5kIGRvIEdFVE1YRFMgQ0NDIG1vcmUKdGhh
biBvbmNlIGFzIGZhciBhcyBJIGtub3c/Cgo+Cj4+ICAgCj4+ICAgCWlmIChkZXN0LnBheWxvYWQu
bGVuICE9IDIgJiYgZGVzdC5wYXlsb2FkLmxlbiAhPSA1KSB7Cj4+ICAgCQlyZXQgPSAtRUlPOwo+
Cj4gVGhhbmtzLAo+IE1pcXXDqGwKPgoKLS0gCmxpbnV4LWkzYyBtYWlsaW5nIGxpc3QKbGludXgt
aTNjQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1h
bi9saXN0aW5mby9saW51eC1pM2MK
