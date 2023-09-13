Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6529EEB595
	for <linux-i3c@archiver.kernel.org>; Wed, 13 Sep 2023 05:58:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ugEH/tTLnA+3BVwz3MKOuufuUrJXQTGxWRZUv0rcIFQ=; b=Ge6O4c+2YR3eeQ
	GTBY7Zu5YWlhh3K0/tV17TBvP3Z1Z8zDgz5rr3X6eAtmqSNIEQmjgBGKpHLhiLl8NPUTP5r8klvtN
	AKM6+yVKcdQm8PDFm+uPpAoImJc07eIaMzGNN0dnQ3xnu0sShdZwRB9MPwXUwNwB+e4vClkyk9Jeu
	YIK/sleuw5Pz1FUCOwC/yOx5dLQ5qpJbNCJVy0j1gUK9XgD0uOgtewkklcdXWSinzn12Mm5/4cnLI
	kBPHi2HVolvMfNjD8qM/Wwc7k0PnCevMZs0U7nw5uQ3U3+NHm/EG8+DYdDYCqRIbW4j0WSowoy+/m
	RksLXW2RYu3WuoZiSRwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qgItb-004jDh-0I;
	Wed, 13 Sep 2023 05:58:39 +0000
Received: from ex01.ufhost.com ([61.152.239.75])
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qgItW-004jB9-0e
	for linux-i3c@lists.infradead.org;
	Wed, 13 Sep 2023 05:58:37 +0000
Received: from EXMBX165.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX165", Issuer "EXMBX165" (not verified))
	by ex01.ufhost.com (Postfix) with ESMTP id C6A0F24DFCE;
	Wed, 13 Sep 2023 13:58:07 +0800 (CST)
Received: from EXMBX066.cuchost.com (172.16.7.66) by EXMBX165.cuchost.com
 (172.16.6.75) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Wed, 13 Sep
 2023 13:58:07 +0800
Received: from [192.168.151.232] (172.16.6.8) by EXMBX066.cuchost.com
 (172.16.6.66) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Wed, 13 Sep
 2023 13:58:06 +0800
Message-ID: <e2783323-6f76-bedb-4e0c-aafba909117b@starfivetech.com>
Date: Wed, 13 Sep 2023 13:58:05 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [PATCH 1/1] i3c: Add fallback method for GETMXDS CCC
To: Miquel Raynal <miquel.raynal@bootlin.com>, <vitor.soares@synopsys.com>,
	<conor.culhane@silvaco.com>
CC: <alexandre.belloni@bootlin.com>, <linux-i3c@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>
References: <20230911082456.23239-1-joshua.yeong@starfivetech.com>
 <20230911082456.23239-2-joshua.yeong@starfivetech.com>
 <20230912130821.21edfafc@xps-13>
Content-Language: en-US
From: Joshua Yeong <joshua.yeong@starfivetech.com>
In-Reply-To: <20230912130821.21edfafc@xps-13>
X-Originating-IP: [172.16.6.8]
X-ClientProxiedBy: EXCAS081.cuchost.com (172.16.6.41) To EXMBX066.cuchost.com
 (172.16.6.66)
X-YovoleRuleAgent: yovoleflag
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230912_225834_532776_564C148E 
X-CRM114-Status: GOOD (  19.02  )
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

SGkgTWlxdWVsLAoKCk9uIDEyLVNlcC0yMyA3OjA4IFBNLCBNaXF1ZWwgUmF5bmFsIHdyb3RlOgo+
IEhpIEpvc2h1YSwKPgo+IGpvc2h1YS55ZW9uZ0BzdGFyZml2ZXRlY2guY29tIHdyb3RlIG9uIE1v
biwgMTEgU2VwIDIwMjMgMTY6MjQ6NTYgKzA4MDA6Cj4KPj4gU29tZSBJM0MgaGFyZHdhcmUgd2ls
bCByZXBvcnQgZXJyb3Igd2hlbiBpbmNvcnJlY3QgbGVuZ3RoIGlzIHJlY2VpdmVkIGZyb20KPj4g
ZGV2aWNlLiBHRVRNWERTIENDQyBhcmUgYXZhaWxibGUgaW4gMiBmb3JtYXRzOyB3aXRob3V0IHR1
cm5hcm91bmQgdGltZSAoZm9ybWF0Cj4+IDEpIGFuZCB3aXRoIHR1cm5hcm91bmQgdGltZSAoZm9y
bWF0IDIpLiBUaGVyZSBpcyBubyBtZWNoYW5pY3MgdG8gZGV0ZXJtaW5lIHdoaWNoCj4+IGZvcm1h
dCBpcyBzdXBwb3J0ZWQgYnkgZGV2aWNlLiBJbiBjYXNlIHNlbmRpbmcgR0VUTVhEUyBDQ0MgZm9y
bWF0IDIgcmVzdWx0ZWQKPj4gZmFpbHVyZSwgdHJ5IHNlbmRpbmcgR0VUTVhEUyBDQ0MgZm9ybWF0
IDEgaW5zdGVhZC4KPj4KPj4gU2lnbmVkLW9mZi1ieTogSm9zaHVhIFllb25nIDxqb3NodWEueWVv
bmdAc3RhcmZpdmV0ZWNoLmNvbT4KPj4gLS0tCj4+ICAgZHJpdmVycy9pM2MvbWFzdGVyLmMgICAg
fCAzMyArKysrKysrKysrKysrKysrKysrKysrKysrKysrLS0tLS0KPj4gICBpbmNsdWRlL2xpbnV4
L2kzYy9jY2MuaCB8IDE3ICsrKysrKysrKysrKysrKy0tCj4+ICAgMiBmaWxlcyBjaGFuZ2VkLCA0
MyBpbnNlcnRpb25zKCspLCA3IGRlbGV0aW9ucygtKQo+Pgo+PiBkaWZmIC0tZ2l0IGEvZHJpdmVy
cy9pM2MvbWFzdGVyLmMgYi9kcml2ZXJzL2kzYy9tYXN0ZXIuYwo+PiBpbmRleCA4NzI4M2U0YTQ2
MDcuLjA4NGY2NGJlZjE1NSAxMDA2NDQKPj4gLS0tIGEvZHJpdmVycy9pM2MvbWFzdGVyLmMKPj4g
KysrIGIvZHJpdmVycy9pM2MvbWFzdGVyLmMKPj4gQEAgLTEwODgsMTAgKzEwODgsMzcgQEAgc3Rh
dGljIGludCBpM2NfbWFzdGVyX2dldG14ZHNfbG9ja2VkKHN0cnVjdCBpM2NfbWFzdGVyX2NvbnRy
b2xsZXIgKm1hc3RlciwKPj4gICAJCQkJICAgICBzdHJ1Y3QgaTNjX2RldmljZV9pbmZvICppbmZv
KQo+PiAgIHsKPj4gICAJc3RydWN0IGkzY19jY2NfZ2V0bXhkcyAqZ2V0bWF4ZHM7Cj4+ICsJc3Ry
dWN0IGkzY19jY2NfZ2V0bXhkc190dXJuYXJvdW5kICpnZXRtYXhkc190YTsKPj4gICAJc3RydWN0
IGkzY19jY2NfY21kX2Rlc3QgZGVzdDsKPj4gICAJc3RydWN0IGkzY19jY2NfY21kIGNtZDsKPj4g
ICAJaW50IHJldDsKPj4gICAKPj4gKwlnZXRtYXhkc190YSA9IGkzY19jY2NfY21kX2Rlc3RfaW5p
dCgmZGVzdCwgaW5mby0+ZHluX2FkZHIsCj4+ICsJCQkJCSBzaXplb2YoKmdldG1heGRzX3RhKSk7
Cj4+ICsJaWYgKCFnZXRtYXhkc190YSkKPj4gKwkJcmV0dXJuIC1FTk9NRU07Cj4+ICsKPj4gKwlp
M2NfY2NjX2NtZF9pbml0KCZjbWQsIHRydWUsIEkzQ19DQ0NfR0VUTVhEUywgJmRlc3QsIDEpOwo+
PiArCXJldCA9IGkzY19tYXN0ZXJfc2VuZF9jY2NfY21kX2xvY2tlZChtYXN0ZXIsICZjbWQpOwo+
PiArCWlmIChyZXQpIHsKPj4gKwkJZ290byBhbHRlcm5hdGl2ZTsKPj4gKwl9Cj4+ICsKPj4gKwlp
ZiAoZGVzdC5wYXlsb2FkLmxlbiAhPSAyICYmIGRlc3QucGF5bG9hZC5sZW4gIT0gNSkgewo+IENh
biBsZW4gYmUgMiBoZXJlPwoKSSBkbyBub3Qga25vdyBpZiBvdGhlciBJUCBhbGxvd3MgbG93ZXIg
cGF5bG9hZCBsZW5ndGguIFRoZSBDYWRlbmNlIElQIAp3aWxsIHRyaWdnZXIgYW4gZXJyb3IgaW4g
Y2FzZSB0aGUgR0VUIENDQyBsZW5ndGggaXMgbWlzbWF0Y2guIE1heSBuZWVkIApWaXRvci9Db25v
ciB0byBjb25maXJtIHRoaXMgYmVoYXZpb3IgaW4gU3lub3BzeXMvU2lsdmFjby4KCj4+ICsJCXJl
dCA9IC1FSU87Cj4+ICsJCWdvdG8gb3V0Owo+PiArCX0KPj4gKwo+PiArCWluZm8tPm1heF9yZWFk
X2RzID0gZ2V0bWF4ZHNfdGEtPm1heHJkOwo+PiArCWluZm8tPm1heF93cml0ZV9kcyA9IGdldG1h
eGRzX3RhLT5tYXh3cjsKPj4gKwlpZiAoZGVzdC5wYXlsb2FkLmxlbiA9PSA1KQo+PiArCQlpbmZv
LT5tYXhfcmVhZF90dXJuYXJvdW5kID0gZ2V0bWF4ZHNfdGEtPm1heHJkdHVyblswXSB8Cj4+ICsJ
CQkJCSAgICAoKHUzMilnZXRtYXhkc190YS0+bWF4cmR0dXJuWzFdIDw8IDgpIHwKPj4gKwkJCQkJ
ICAgICgodTMyKWdldG1heGRzX3RhLT5tYXhyZHR1cm5bMl0gPDwgMTYpOwo+IERvbid0IHlvdSB3
YW50IHRvIGF2b2lkIHRoZSAiYWx0ZXJuYXRpdmUiIGlmIGl0IHdvcmtlZD8KVGhhbmsgeW91LCB3
aWxsIGZpeCB0aGlzLgo+Cj4+ICsKPj4gK2FsdGVybmF0aXZlOgo+IEkgd291bGQgZXhwZWN0IGEg
Y29tbWVudCBzb21ld2hlcmUgdG8gZXhwbGFpbiB0aGUgc3VidGxldHkuCldpbGwgYWRkIGNvbW1l
bnRzIHRvIGV4cGxhaW4gdGhpcyBjb2RlLgo+Cj4+ICsJaTNjX2NjY19jbWRfZGVzdF9jbGVhbnVw
KCZkZXN0KTsKPj4gKwo+PiAgIAlnZXRtYXhkcyA9IGkzY19jY2NfY21kX2Rlc3RfaW5pdCgmZGVz
dCwgaW5mby0+ZHluX2FkZHIsCj4+ICAgCQkJCQkgc2l6ZW9mKCpnZXRtYXhkcykpOwo+PiAgIAlp
ZiAoIWdldG1heGRzKQo+PiBAQCAtMTEwMiwxNyArMTEyOSwxMyBAQCBzdGF0aWMgaW50IGkzY19t
YXN0ZXJfZ2V0bXhkc19sb2NrZWQoc3RydWN0IGkzY19tYXN0ZXJfY29udHJvbGxlciAqbWFzdGVy
LAo+PiAgIAlpZiAocmV0KQo+PiAgIAkJZ290byBvdXQ7Cj4+ICAgCj4+IC0JaWYgKGRlc3QucGF5
bG9hZC5sZW4gIT0gMiAmJiBkZXN0LnBheWxvYWQubGVuICE9IDUpIHsKPj4gKwlpZiAoZGVzdC5w
YXlsb2FkLmxlbiAhPSAyKSB7Cj4+ICAgCQlyZXQgPSAtRUlPOwo+PiAgIAkJZ290byBvdXQ7Cj4+
ICAgCX0KPj4gICAKPj4gICAJaW5mby0+bWF4X3JlYWRfZHMgPSBnZXRtYXhkcy0+bWF4cmQ7Cj4+
ICAgCWluZm8tPm1heF93cml0ZV9kcyA9IGdldG1heGRzLT5tYXh3cjsKPj4gLQlpZiAoZGVzdC5w
YXlsb2FkLmxlbiA9PSA1KQo+PiAtCQlpbmZvLT5tYXhfcmVhZF90dXJuYXJvdW5kID0gZ2V0bWF4
ZHMtPm1heHJkdHVyblswXSB8Cj4+IC0JCQkJCSAgICAoKHUzMilnZXRtYXhkcy0+bWF4cmR0dXJu
WzFdIDw8IDgpIHwKPj4gLQkJCQkJICAgICgodTMyKWdldG1heGRzLT5tYXhyZHR1cm5bMl0gPDwg
MTYpOwo+PiAgIAo+PiAgIG91dDoKPj4gICAJaTNjX2NjY19jbWRfZGVzdF9jbGVhbnVwKCZkZXN0
KTsKPj4gZGlmZiAtLWdpdCBhL2luY2x1ZGUvbGludXgvaTNjL2NjYy5oIGIvaW5jbHVkZS9saW51
eC9pM2MvY2NjLmgKPj4gaW5kZXggYWQ1OWE0YWU2MGQxLi41MGVkNDFkNGQ1YTEgMTAwNjQ0Cj4+
IC0tLSBhL2luY2x1ZGUvbGludXgvaTNjL2NjYy5oCj4+ICsrKyBiL2luY2x1ZGUvbGludXgvaTNj
L2NjYy5oCj4+IEBAIC0yNjksMTQgKzI2OSwyNyBAQCBlbnVtIGkzY190c2NvIHsKPj4gICAjZGVm
aW5lIEkzQ19DQ0NfTUFYX1NEUl9GU0NMKHgpCQkoKHgpICYgSTNDX0NDQ19NQVhfU0RSX0ZTQ0xf
TUFTSykKPj4gICAKPj4gICAvKioKPj4gLSAqIHN0cnVjdCBpM2NfY2NjX2dldG14ZHMgLSBwYXls
b2FkIHBhc3NlZCB0byBHRVRNWERTIENDQwo+PiArICogc3RydWN0IGkzY19jY2NfZ2V0bXhkcyAt
IHBheWxvYWQgcGFzc2VkIHRvIEdFVE1YRFMgQ0NDIHdpdGhvdXQgdHVybmFyb3VuZAo+PiArICog
KGZvcm1hdCAxKQo+PiArICoKPj4gKyAqIEBtYXh3cjogd3JpdGUgbGltaXRhdGlvbnMKPj4gKyAq
IEBtYXhyZDogcmVhZCBsaW1pdGF0aW9ucwo+PiArICovCj4+ICtzdHJ1Y3QgaTNjX2NjY19nZXRt
eGRzIHsKPj4gKwl1OCBtYXh3cjsKPj4gKwl1OCBtYXhyZDsKPj4gK30gX19wYWNrZWQ7Cj4+ICsK
Pj4gKy8qKgo+PiArICogc3RydWN0IGkzY19jY2NfZ2V0bXhkc190YSAtIHBheWxvYWQgcGFzc2Vk
IHRvIEdFVE1YRFMgQ0NDIHdpdGggdHVybmFyb3VuZAo+PiArICogKGZvcm1hdCAyKQo+PiAgICAq
Cj4+ICAgICogQG1heHdyOiB3cml0ZSBsaW1pdGF0aW9ucwo+PiAgICAqIEBtYXhyZDogcmVhZCBs
aW1pdGF0aW9ucwo+PiAgICAqIEBtYXhyZHR1cm46IG1heGltdW0gcmVhZCB0dXJuLWFyb3VuZCBl
eHByZXNzZWQgbWljcm8tc2Vjb25kcyBhbmQKPj4gICAgKgkgICAgICAgbGl0dGxlLWVuZGlhbiBm
b3JtYXR0ZWQKPj4gICAgKi8KPj4gLXN0cnVjdCBpM2NfY2NjX2dldG14ZHMgewo+PiArc3RydWN0
IGkzY19jY2NfZ2V0bXhkc190dXJuYXJvdW5kIHsKPj4gICAJdTggbWF4d3I7Cj4+ICAgCXU4IG1h
eHJkOwo+PiAgIAl1OCBtYXhyZHR1cm5bM107Cj4KPiBUaGFua3MsCj4gTWlxdcOobAoKLS0gCmxp
bnV4LWkzYyBtYWlsaW5nIGxpc3QKbGludXgtaTNjQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDov
L2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1pM2MK
