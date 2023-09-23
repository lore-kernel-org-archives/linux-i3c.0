Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D281CCE7A89
	for <linux-i3c@archiver.kernel.org>; Sat, 23 Sep 2023 08:27:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=b+GePzTgkDOoy1KwlOTjGCntXB4mHVyS0cnhlrQCFQI=; b=HVfq4b50IF+CK/
	BjrKgk6Z3c2d+S9BClzpzMqRfRQG/0Iq/aCGlcjWZvWqV8G50LTKEBMfHDMWW5gjqlfhKMVS9aL7L
	f8nHy0LP8lVDhNwX3K6HUMvn4lLlKwtcgdnIJRCc/L8WcIhsmZwTwUVrFKzqM6BmvJZuMHck19ees
	qlIKzfyBE0eeREk83XuCUvUtkHRV9fC065UWV7xlkTFW+Tfa/g9cf1TZU/VbS+NWGsLRAv/3/15j/
	RhAZvcUqjl7EaVAUJJci4su0qbb5bABej1PB4uqDeADFojcrl6x5jBnwCEJZebWH3bSE/BT8XKrlW
	20sOb+sHzxLtRW1mJeig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qjxzU-00AdsZ-0W;
	Sat, 23 Sep 2023 08:27:52 +0000
Received: from omta36.uswest2.a.cloudfilter.net ([35.89.44.35])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qjxzR-00Adr7-2W
	for linux-i3c@lists.infradead.org;
	Sat, 23 Sep 2023 08:27:51 +0000
Received: from eig-obgw-5002a.ext.cloudfilter.net ([10.0.29.215])
	by cmsmtp with ESMTP
	id jx8dqvAaKEoVsjxzEqGuAY; Sat, 23 Sep 2023 08:27:37 +0000
Received: from gator4166.hostgator.com ([108.167.133.22])
	by cmsmtp with ESMTPS
	id jxzDqx4fEZb7MjxzEq1BsN; Sat, 23 Sep 2023 08:27:36 +0000
X-Authority-Analysis: v=2.4 cv=Z57/oVdA c=1 sm=1 tr=0 ts=650ea178
 a=1YbLdUo/zbTtOZ3uB5T3HA==:117 a=P7XfKmiOJ4/qXqHZrN7ymg==:17
 a=OWjo9vPv0XrRhIrVQ50Ab3nP57M=:19 a=dLZJa+xiwSxG16/P+YVxDGlgEgI=:19
 a=IkcTkHD0fZMA:10 a=zNV7Rl7Rt7sA:10 a=wYkD_t78qR0A:10 a=NEAV23lmAAAA:8
 a=Br2UW1UjAAAA:8 a=P-IC7800AAAA:8 a=JfrnYn6hAAAA:8 a=cm27Pg_UAAAA:8
 a=VwQbUJbxAAAA:8 a=HvF037n1xESchLcPDVoA:9 a=QEXdDO2ut3YA:10
 a=WmXOPjafLNExVIMTj843:22 a=d3PnA9EDa4IxuAV0gXij:22 a=1CNFftbPRP8L7MoqJWF3:22
 a=xmb-EsYY8bH0VWELuYED:22 a=AjGcO6oz07-iQ99wixmX:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=embeddedor.com; s=default; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=EwHnq9I0ZYfBC9SDu/UVPRBfrk7HElWovqnm5r2GxWA=; b=YzUh/LDMRIGUk67Yuyv1IzBbaa
	6EokWx7gUQjHkRhjyAh4KuuD5VpiDenUXMHqLB64Br95oh0hEh1d0VTmzgNCu5HRSmJ8gI1wSo9ot
	dEUamL+lKMt/pk/nWXarWm0+Yni2ZmaghyoXa3N0STXx08UR14NDt3orMVnXTlqCctdm8D98Wo9TW
	gqkUadawfosqh+VG2ZnVIybcc6qrsQcAfihIqX2b51ckVKStWiIyjVW1UE+E9NpV0iG77XCxAFoqS
	H1GuiQhZ2FqmO0z9aZQOpeaL277gk/SNjS64IY2uEnw9gsIEt+gcnZz7GoFyXaBuKZlXVVFuBd7tq
	yOHxgZAw==;
Received: from [94.239.20.48] (port=50186 helo=[192.168.1.98])
	by gator4166.hostgator.com with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.96)
	(envelope-from <gustavo@embeddedor.com>)
	id 1qjxzC-003X6p-3B;
	Sat, 23 Sep 2023 03:27:35 -0500
Message-ID: <a93452ff-6611-d14d-37b1-09afbf0d7348@embeddedor.com>
Date: Sat, 23 Sep 2023 10:28:40 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH] i3c: master: cdns: Annotate struct cdns_i3c_xfer with
 __counted_by
Content-Language: en-US
To: Kees Cook <keescook@chromium.org>, =?UTF-8?Q?Przemys=c5=82aw_Gaj?=
 <pgaj@cadence.com>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
 linux-i3c@lists.infradead.org, Nathan Chancellor <nathan@kernel.org>,
 Nick Desaulniers <ndesaulniers@google.com>, Tom Rix <trix@redhat.com>,
 linux-kernel@vger.kernel.org, llvm@lists.linux.dev,
 linux-hardening@vger.kernel.org
References: <20230922175014.work.637-kees@kernel.org>
From: "Gustavo A. R. Silva" <gustavo@embeddedor.com>
In-Reply-To: <20230922175014.work.637-kees@kernel.org>
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - gator4166.hostgator.com
X-AntiAbuse: Original Domain - lists.infradead.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - embeddedor.com
X-BWhitelist: no
X-Source-IP: 94.239.20.48
X-Source-L: No
X-Exim-ID: 1qjxzC-003X6p-3B
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: ([192.168.1.98]) [94.239.20.48]:50186
X-Source-Auth: gustavo@embeddedor.com
X-Email-Count: 62
X-Org: HG=hgshared;ORG=hostgator;
X-Source-Cap: Z3V6aWRpbmU7Z3V6aWRpbmU7Z2F0b3I0MTY2Lmhvc3RnYXRvci5jb20=
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfNXOaxegejjFp4ARjp1YuUmxGHMN22otCw3Isz+Bv4XSlxF5e/3BRTRaUt2DxrwJIG4pDbaCiPuEGPaVLquQCxtypVk0aY6DADfB+KmSUxix6tH7HLsT
 9bESiCTxjGkq9GsLothhPQt8noQSDsIICH/c8Z7XF6i79sgDBDvNRm51aZJIL7zCMzzLeEFa1ocN94KNayNLYUwT/QzjaTUAYm+KqUu5e2s2xDLlv1mjgOsz
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230923_012749_864452_A69648C2 
X-CRM114-Status: GOOD (  10.35  )
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

CgpPbiA5LzIyLzIzIDExOjUwLCBLZWVzIENvb2sgd3JvdGU6Cj4gUHJlcGFyZSBmb3IgdGhlIGNv
bWluZyBpbXBsZW1lbnRhdGlvbiBieSBHQ0MgYW5kIENsYW5nIG9mIHRoZSBfX2NvdW50ZWRfYnkK
PiBhdHRyaWJ1dGUuIEZsZXhpYmxlIGFycmF5IG1lbWJlcnMgYW5ub3RhdGVkIHdpdGggX19jb3Vu
dGVkX2J5IGNhbiBoYXZlCj4gdGhlaXIgYWNjZXNzZXMgYm91bmRzLWNoZWNrZWQgYXQgcnVuLXRp
bWUgY2hlY2tpbmcgdmlhIENPTkZJR19VQlNBTl9CT1VORFMKPiAoZm9yIGFycmF5IGluZGV4aW5n
KSBhbmQgQ09ORklHX0ZPUlRJRllfU09VUkNFIChmb3Igc3RyY3B5L21lbWNweS1mYW1pbHkKPiBm
dW5jdGlvbnMpLgo+IAo+IEFzIGZvdW5kIHdpdGggQ29jY2luZWxsZVsxXSwgYWRkIF9fY291bnRl
ZF9ieSBmb3Igc3RydWN0IGNkbnNfaTNjX3hmZXIuCj4gCj4gWzFdIGh0dHBzOi8vZ2l0aHViLmNv
bS9rZWVzL2tlcm5lbC10b29scy9ibG9iL3RydW5rL2NvY2NpbmVsbGUvZXhhbXBsZXMvY291bnRl
ZF9ieS5jb2NjaQo+IAo+IENjOiAiUHJ6ZW15c8WCYXcgR2FqIiA8cGdhakBjYWRlbmNlLmNvbT4K
PiBDYzogQWxleGFuZHJlIEJlbGxvbmkgPGFsZXhhbmRyZS5iZWxsb25pQGJvb3RsaW4uY29tPgo+
IENjOiBsaW51eC1pM2NAbGlzdHMuaW5mcmFkZWFkLm9yZwo+IFNpZ25lZC1vZmYtYnk6IEtlZXMg
Q29vayA8a2Vlc2Nvb2tAY2hyb21pdW0ub3JnPgoKUmV2aWV3ZWQtYnk6IEd1c3Rhdm8gQS4gUi4g
U2lsdmEgPGd1c3Rhdm9hcnNAa2VybmVsLm9yZz4KClRoYW5rcwotLSAKR3VzdGF2bwoKPiAtLS0K
PiAgIGRyaXZlcnMvaTNjL21hc3Rlci9pM2MtbWFzdGVyLWNkbnMuYyB8IDIgKy0KPiAgIDEgZmls
ZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQo+IAo+IGRpZmYgLS1naXQg
YS9kcml2ZXJzL2kzYy9tYXN0ZXIvaTNjLW1hc3Rlci1jZG5zLmMgYi9kcml2ZXJzL2kzYy9tYXN0
ZXIvaTNjLW1hc3Rlci1jZG5zLmMKPiBpbmRleCA0OTU1MWRiNzFiYzkuLjk3YzEwMTA5NTZhMCAx
MDA2NDQKPiAtLS0gYS9kcml2ZXJzL2kzYy9tYXN0ZXIvaTNjLW1hc3Rlci1jZG5zLmMKPiArKysg
Yi9kcml2ZXJzL2kzYy9tYXN0ZXIvaTNjLW1hc3Rlci1jZG5zLmMKPiBAQCAtMzg3LDcgKzM4Nyw3
IEBAIHN0cnVjdCBjZG5zX2kzY194ZmVyIHsKPiAgIAlzdHJ1Y3QgY29tcGxldGlvbiBjb21wOwo+
ICAgCWludCByZXQ7Cj4gICAJdW5zaWduZWQgaW50IG5jbWRzOwo+IC0Jc3RydWN0IGNkbnNfaTNj
X2NtZCBjbWRzW107Cj4gKwlzdHJ1Y3QgY2Ruc19pM2NfY21kIGNtZHNbXSBfX2NvdW50ZWRfYnko
bmNtZHMpOwo+ICAgfTsKPiAgIAo+ICAgc3RydWN0IGNkbnNfaTNjX2RhdGEgewoKLS0gCmxpbnV4
LWkzYyBtYWlsaW5nIGxpc3QKbGludXgtaTNjQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xp
c3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1pM2MK
