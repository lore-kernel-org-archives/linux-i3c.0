Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF227D3B7EA
	for <linux-i3c@archiver.kernel.org>; Tue,  9 Dec 2025 11:37:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:Subject:From:References:CC:To:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YQ6G2cMw5XhuprYfqP1Yg/b2VEZsEybxXxKVnKw7SOg=; b=ZyhfM3aJjEMlgn
	THicWF3ExZRduaePGRvGnsqm3ZeRbwYJm+q1hzTj5Ref/6whPLzo8SsReOdOVmpH3nvU0RbaB34xo
	7Jo7e5HjuA+7nGyaJr5VnE9k7k/TuiKd+Omf9TigyacHFPCOy1/ZsPvmcpuaiR4aKQf0vvupMkjsI
	QtK5XyGibjq6j/cx3a19JVCxn43r82eIBgYs9ZVkIjAQuWCfLQ98DDKJvfHUWCfvduPgK0zBFM0Q8
	O7J64HPuVXDMmqjUMBcsD+G7HBdfUPFXPcG4ni/GA5jX19WHPNhOCkunmZ6TrcePduaW/ppunbBUV
	spSBl449jtmlQAyDPn+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vSw20-0000000ECCa-1rdd;
	Tue, 09 Dec 2025 11:37:24 +0000
Received: from 2.mo15.mail-out.ovh.net ([5.135.90.179])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vSw1w-0000000ECC5-3Vmu
	for linux-i3c@lists.infradead.org;
	Tue, 09 Dec 2025 11:37:23 +0000
Received: from DAGFR10EX1.OVH.local (unknown [10.110.37.60])
	by mo15.mail-out.ovh.net (Postfix) with ESMTPS id 4dQcJp0ZJNz3wq2;
	Tue,  9 Dec 2025 11:37:14 +0000 (UTC)
Received: from [10.15.124.206] (109.190.254.33) by DAGFR10EX1.OVH.local
 (172.16.2.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.2562.29; Tue, 9 Dec
 2025 12:37:13 +0100
Message-ID: <b9b568e8-8e21-49ac-b3dd-ab750fc329aa@ovhcloud.com>
Date: Tue, 9 Dec 2025 12:37:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: <alexandre.belloni@bootlin.com>
CC: <linux-i3c@lists.infradead.org>
References: <66f5e4db-ac20-4bec-a437-af86aad1f56e@ovhcloud.com>
 <202512082058408ee92ee8@mail.local>
Content-Language: en-US
From: Louis Sautier <louis.sautier@ovhcloud.com>
Autocrypt: addr=louis.sautier@ovhcloud.com; keydata=
 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
 RsE2POMT+tiu+v1zM9499+7oCyCEtQ==
Subject: Re: Error while loading dw-i3c-master: UBSAN: shift-out-of-bounds in
 drivers/i3c/master/dw-i3c-master.c:885:12
In-Reply-To: <202512082058408ee92ee8@mail.local>
X-Originating-IP: [109.190.254.33]
X-ClientProxiedBy: CAS2.OVH.local (172.16.1.2) To DAGFR10EX1.OVH.local
 (172.16.2.30)
X-OVH-CORPLIMIT-SKIP: true
X-Ovh-Tracer-Id: 714383492784386683
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: 0
X-VR-SPAMCAUSE: dmFkZTFzQLlNB7skVjvxNsFzSnA9K6bOgDVvvyb1TEZUnMbwxvILe5sepgLWiE0lSNBcfbZk+52Qt17Fk7n1zG6ThoL5ZTms3EnkuQsaJjKh1gVFkg4bBWID7n/BO5eOdpa8myaZ0hxSb1VPKzRyj/53aOvHpWqOz2XlJRMRdm42Ns0hEeOdI54lQhpf7pMoxZRyxXwINBYaBSharocn5oliBwMDbwrnK/3gaAV8ywFB9mT6GKrVRevSXJi8hhcARDctnOZNM8GsRXUgT1kDtVD3CXwD9FZWuCl4dAXr+v8/LHKqPSU0o3TRoNpXJnwXKXgTrb5rFGhww/dMYLtoHm6ETSwDcl9JjK1emjiX7d/KhD7jd+idVzeTP79Zf7HnN3Lar0ZfacPHcOWtCrKmm3T3QJ6w9sI1EpbsmCcAhCAL253sr5qvyqbN9bhT9h6DUSqaL1NAgejrmPiJA0eSLin8GF9PbFjOKDBjHDP13hAmKuS+hQeIsgutXm3z3Him4TcKFTqWlahIW919ZwjIPgIbhjavdm4VcnVlYXwg8NGHPkWXhj0dJzbOCNNVQv+hsSfXbDVMtvpWhp1jnhxPEoTxeU/zeAQYGCUTFJh5zdq8QsSzsn9EvSo6OdEw6NqdBuo0HybnKxYMuDQVK4s1RJH5E01+RGrEQ48DmZWzbhjzb3yUpg
DKIM-Signature: a=rsa-sha256; bh=ExTt+d1SFE5bxz1L1khD1kb/Nho4d5XtKu+3mZb4CCc=;
 c=relaxed/relaxed; d=ovhcloud.com; h=From; s=mailout; t=1765280234; v=1;
 b=XKIpWC2tQedFDlPChlds7avMqREOE3WfPl+An225ozve5o2gwwIPmVpILj1bdpGzOR/9vN5K
 Un7S98Eh2vgWlSAMbjUvPyLQFRRpjTPwDPHw97kh815MFpntx84ljFHHwzo8APkC42cspgM6nwj
 +bs6EPLJZrWNC6qNnyVliPEM=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251209_033721_460209_4E16FB40 
X-CRM114-Status: GOOD (  13.08  )
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

T24gMTIvOC8yNSAyMTo1OCwgQWxleGFuZHJlIEJlbGxvbmkgd3JvdGU6Cj4gSGVsbG8gTG91aXMs
Cj4KPiBPbiAwMi8xMi8yMDI1IDIxOjE3OjMxKzAxMDAsIExvdWlzIFNhdXRpZXIgd3JvdGU6Cj4+
IEhlbGxvLAo+Pgo+PiBJJ20gcnVubmluZyBpbnRvIGEgYnVnIHdoZW4gbG9hZGluZyB0aGUgZHct
aTNjLW1hc3RlciBtb2R1bGUgb24ga2VybmVsIDYuMTgKPj4gb24gb25lIHNwZWNpZmljIHNlcnZl
ci4gSSBzdXNwZWN0IGl0IGhhcyB0byBkbyB3aXRoIHRoZSBsYXJnZSBudW1iZXIgb2YKPj4gQ1BV
c8Kgb24gdGhlIG1hY2hpbmXCoCg3NjggdGhyZWFkcywgZnJvbSAyIEFNRCBFUFlDIDk5NjUgcHJv
Y2Vzc29ycykgYnV0IEkgYW0KPj4gbm90IHN1cmUuCj4+Cj4+IFRoZSBzeXN0ZW0gaXMgb24gVWJ1
bnR1IDI1LjEwIGFuZCBhIDYuMTgga2VybmVsIHdpdGggaHR0cHM6Ly9naXN0LmdpdGh1YnVzZXJj
b250ZW50LmNvbS9zYnJhei9hNmYzN2ZhZmJjZjkzNTRiYmU0ZWFjZTllOWViNDhjYi9yYXcvMTE1
ZGE1OTRkYzlkN2VhOTliMDY3NTQ4NDc1NzFlNmZkNzZkOWRhNS9jb25maWcKPj4gKGJhc2ljYWxs
eSBVYnVudHUncykuCj4gSnVzdCB0byBiZSBzdXJlLCBkb2VzIHRoaXMgYWxzbyBoYXBwZW4gd2l0
aCB2Ni4xNz8KPgo+IFRoZSBvbmx5IGNoYW5nZSBpcyB0aGUgc2h1dGRvd24gaGFuZGxpbmcgc28g
SSB3b3VsZCBndWVzcyB5ZXMuCj4KSGVsbG8sCgpJdCBkb2VzIGhhcHBlbiB3aXRoIDYuMTcuIEkg
aW5pdGlhbGx5IGRpc2NvdmVyZWQgdGhpcyB3aGlsZSBydW5uaW5nIApVYnVudHUgMjUuMTAncyBz
dG9jayBrZXJuZWwgKDYuMTcuMCkuCgogPiBXaGF0IGlzIHRoZSBiZWhhdmlvciB3aGVuIHlvdSBi
dWlsZCB0aGUgZHctaTNjLW1hc3RlciBhcyBhIHN0YXRpYyAKZHJpdmVyPyBJJ2xsIHRyeSBDT05G
SUdfRFdfSTNDX01BU1RFUj15IGFuZCByZXBvcnQgYmFjay4KClNvbWVvbmUgYWxzbyBzdWdnZXN0
ZWQgKHRoZXkgZGlkbid0IHJlcGx5IHRvIHRoZSBsaXN0IHRob3VnaCkgdGhhdCBJIGFkZCAKYSBw
cmludGsgdG8gc2VlIHdoYXQgdGhlIHZhbHVlIG9mIG1heGRldnMgaXMuIEknbGwgcHJvdmlkZSB0
aGUgbG9nIGFzIApzb29uIGFzIEkgaGF2ZSByZWJ1aWx0IHdpdGg6CgotLS0gbGludXgtNi4xOC5v
cmlnL2RyaXZlcnMvaTNjL21hc3Rlci9kdy1pM2MtbWFzdGVyLmMJMjAyNS0xMS0zMCAyMjo0Mjox
MC4wMDAwMDAwMDAgKzAwMDAKKysrIGxpbnV4LTYuMTgvZHJpdmVycy9pM2MvbWFzdGVyL2R3LWkz
Yy1tYXN0ZXIuYwkyMDI1LTEyLTA4IDE4OjE3OjMzLjE1MTU2NzIyNSArMDAwMApAQCAtMTU4OCw2
ICsxNTg4LDcgQEAKICAJcmV0ID0gcmVhZGwobWFzdGVyLT5yZWdzICsgREVWSUNFX0FERFJfVEFC
TEVfUE9JTlRFUik7CiAgCW1hc3Rlci0+ZGF0c3RhcnRhZGRyID0gcmV0OwogIAltYXN0ZXItPm1h
eGRldnMgPSByZXQgPj4gMTY7CisJcHJpbnRrKCJtYXhkZXZzOiAlZFxuIiwgIG1hc3Rlci0+bWF4
ZGV2cyk7CiAgCW1hc3Rlci0+ZnJlZV9wb3MgPSBHRU5NQVNLKG1hc3Rlci0+bWF4ZGV2cyAtIDEs
IDApOwogIAogIAltYXN0ZXItPnF1aXJrcyA9ICh1bnNpZ25lZCBsb25nKWRldmljZV9nZXRfbWF0
Y2hfZGF0YSgmcGRldi0+ZGV2KTsKCgoKLS0gCmxpbnV4LWkzYyBtYWlsaW5nIGxpc3QKbGludXgt
aTNjQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1h
bi9saXN0aW5mby9saW51eC1pM2MK
