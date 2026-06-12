Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9845DCD8CA8
	for <linux-i3c@archiver.kernel.org>; Fri, 12 Jun 2026 11:33:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	References:In-Reply-To:Cc:To:Subject:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gLX88JW3S+/+k81jQ7QOs2TwiAlHCbHFtgFjtuRJDz8=; b=AKc5kabBJKwOpK
	3wRpQv4u04kRWwbD7i/Ceb1QKw+4iKGDQ4d+6IIDZqFWxKBi1nzPJjUtfMbU/c1Ur2spdN66Q/A9M
	UmWObWrQkLYSb0wLmmmSAN1Pum0wBLATqIgZySINrZDTpt50J4gvoQiOPYrI0Sf+ympVl2Xvhb1Wx
	U5POHZb8soJWcVKZa1SAjBtbagUOvCVa32SXsow6we+Sr5RQT/qXzjrsmasBmiETDp5/nD3upB134
	w7zYxfvzCeQYVgW8W8rbtCIZbBioq1lzNsrfUsIYMCk8nbNC01Z3HrbcUKiTJ+7zNRuQK7ucSKnPu
	u9yiTzZBtiBTd6LAqiJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wY096-0000000AoE0-1Z9y;
	Fri, 12 Jun 2026 11:33:56 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wY095-0000000AoDs-285U
	for linux-i3c@lists.infradead.org;
	Fri, 12 Jun 2026 11:33:55 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id E709641767;
	Fri, 12 Jun 2026 11:33:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 14AA31F000E9;
	Fri, 12 Jun 2026 11:33:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781264034;
	bh=M4rNj4QcWLEHQGUaBLQEwMisVeEKG2/d81qhNxHTVhY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=g6/9ijNHtW5JG6Rob/EwpmNb67m9kQC1sX/bAvcZFgczW/RaMfb4EWP3cG9kkMyh6
	 U5yC9awE3FLd0zu1sKr3oyXe19B0295CWURoRMo22u61WdeWtEqB5OVJy0aKOTrR2w
	 XI9UM7KSiRevWa8o5bqs3bVGQlDKr6bvu3J8MCahjzBFNmcZaQZsp9k/6a8EOgeK/e
	 ZvJkWrBsTTnGRQxd5RhfECevDjzzOz9guq0+ar4PkA5zDob09LmQ//tqmY+EpQVNDp
	 EkBfqvsctyhGsqr2jsVAcr2mEUewi5Pul+9dVVKyG3a5ULVc2CCutCPNlnkD3LV7Ue
	 KR0PYgfNDldKA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v11 4/9] dt-bindings: i3c: Add NXP P3H2x4x i3c-hub
 support
To: "Lakshay Piplani" <lakshay.piplani@nxp.com>
Cc: Frank.Li@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org, linux-i3c@lists.infradead.org
In-Reply-To: <20260612111816.3688240-5-lakshay.piplani@nxp.com>
References: <20260612111816.3688240-5-lakshay.piplani@nxp.com>
Date: Fri, 12 Jun 2026 11:33:53 +0000
Message-Id: <20260612113354.14AA31F000E9@smtp.kernel.org>
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
Reply-To: sashiko-reviews@lists.linux.dev
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org

VGhhbmsgeW91IGZvciB5b3VyIGNvbnRyaWJ1dGlvbiEgU2FzaGlrbyBBSSByZXZpZXcgZm91bmQg
MiBwb3RlbnRpYWwgaXNzdWUocykgdG8gY29uc2lkZXI6Ci0gW01lZGl1bV0gTWlzc2luZyBHUElP
IHByb3ZpZGVyIHByb3BlcnRpZXMgYW5kIGNvbnN0cmFpbnRzIGluIHRoZSBEVCBiaW5kaW5nIHNj
aGVtYSwgdmlvbGF0aW5nIHN1YnN5c3RlbSBndWlkZWxpbmVzLgotIFtNZWRpdW1dIE1pc3Npbmcg
Y29tcGF0aWJsZSBzdHJpbmdzIGFuZCBwb3J0IGNvbnN0cmFpbnRzIGZvciB0aGUgZG9jdW1lbnRl
ZCA0LXBvcnQgaGFyZHdhcmUgdmFyaWFudHMgKFAzSDI0NDAvUDNIMjQ0MSkuCi0tCgpjb21taXQg
Y2ZkOGNkMzEwMjdmOWRkY2RkMzBmZTU5NWQ1ZDk0N2RjOGJhZTQ5YgpBdXRob3I6IEFtYW4gS3Vt
YXIgUGFuZGV5IDxhbWFuLmt1bWFycGFuZGV5QG54cC5jb20+CgpkdC1iaW5kaW5nczogaTNjOiBB
ZGQgTlhQIFAzSDJ4NHggaTNjLWh1YiBzdXBwb3J0CgpBZGRzIGJpbmRpbmdzIGZvciB0aGUgTlhQ
IFAzSDJ4NHggbXVsdGlwb3J0IEkzQyBodWIgZmFtaWx5LiBUaGVzZSBkZXZpY2VzCmNvbm5lY3Qg
dG8gYSBob3N0IHZpYSBJM0MvSTJDL1NNQnVzIGFuZCBhbGxvdyBjb21tdW5pY2F0aW9uIHdpdGgg
bXVsdGlwbGUKZG93bnN0cmVhbSBwZXJpcGhlcmFscy4KCj4gZGlmZiAtLWdpdCBhL0RvY3VtZW50
YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9pM2MvbnhwLHAzaDI4NDAueWFtbCBiL0RvY3VtZW50
YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9pM2MvbnhwLHAzaDI4NDAueWFtbAo+IG5ldyBmaWxl
IG1vZGUgMTAwNjQ0Cj4gaW5kZXggMDAwMDAwMDAwMDAwMC4uYzA4MGVlYjBlZWFhOAo+IC0tLSAv
ZGV2L251bGwKPiArKysgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvaTNjL254
cCxwM2gyODQwLnlhbWwKPiBAQCAtMCwwICsxLDI5MSBAQAo+ICsjIFNQRFgtTGljZW5zZS1JZGVu
dGlmaWVyOiAoR1BMLTIuMC1vbmx5IE9SIEJTRC0yLUNsYXVzZSkKPiArIyBDb3B5cmlnaHQgMjAy
NSBOWFAKPiArJVlBTUwgMS4yCj4gKy0tLQo+ICskaWQ6IGh0dHA6Ly9kZXZpY2V0cmVlLm9yZy9z
Y2hlbWFzL2kzYy9ueHAscDNoMjg0MC55YW1sIwo+ICskc2NoZW1hOiBodHRwOi8vZGV2aWNldHJl
ZS5vcmcvbWV0YS1zY2hlbWFzL2NvcmUueWFtbCMKPiArCj4gK3RpdGxlOiBOWFAgUDNIMlg0WCBJ
M0MgSFVCCgpbIC4uLiBdCgo+ICtkZXNjcmlwdGlvbjogfAo+ICsgIFAzSDJ4NHggKFAzSDI0NDAv
UDNIMjQ0MS9QM0gyODQwL1AzSDI4NDEpIGlzIGEgZmFtaWx5IG9mIG11bHRpcG9ydCBJM0MKPiAr
ICBodWIgZGV2aWNlcyB0aGF0IGNvbm5lY3QgdG86LQo+ICsgIDEuIEEgaG9zdCBDUFUgdmlhIEkz
Qy9JMkMvU01CdXMgYnVzIG9uIHVwc3RyZWFtIHNpZGUgYW5kIGNvbm5lY3QgdG8gbXVsdGlwbGUK
PiArICAgICBwZXJpcGhlcmFsIGRldmljZXMgb24gdGhlIGRvd25zdHJlYW0gIHNpZGUuCj4gKyAg
Mi4gSGF2ZSB0d28gQ29udHJvbGxlciBQb3J0cyB3aGljaCBjYW4gc3VwcG9ydCBlaXRoZXIKPiAr
ICAgICBJMkMvU01CdXMgb3IgSTNDIGJ1c2VzIGFuZCBjb25uZWN0IHRvIGEgQ1BVLCBCTUMgb3Ig
U09DLgo+ICsgIDMuIFAzSDI4NDAvIFAzSDI4NDEgYXJlIDggcG9ydCBJM0MgaHViIHdpdGggZWln
aHQgSTNDL0kyQyBUYXJnZXQgUG9ydC4KPiArICA0LiBQM0gyNDQwLyBQM0gyNDQxIGFyZSA0IHBv
cnQgSTNDIGh1YiB3aXRoIGZvdXIgSTNDL0kyQyBUYXJnZXQgUG9ydC4KPiArICAgICBUYXJnZXQg
cG9ydHMgY2FuIGJlIGNvbmZpZ3VyZWQgYXMgSTJDL1NNQnVzLCBJM0Mgb3IgR1BJTyBhbmQgY29u
bmVjdCB0bwo+ICsgICAgIHBlcmlwaGVyYWxzLgoKW1NldmVyaXR5OiBNZWRpdW1dCklmIHRoZSB0
YXJnZXQgcG9ydHMgY2FuIGJlIGNvbmZpZ3VyZWQgYXMgR1BJTywgc2hvdWxkIHRoZSBzY2hlbWEg
aW5jbHVkZSB0aGUKY29ycmVzcG9uZGluZyBwcm92aWRlciBwcm9wZXJ0aWVzIChzdWNoIGFzIGdw
aW8tY29udHJvbGxlciBhbmQgI2dwaW8tY2VsbHMpPwpXaXRob3V0IHRoZXNlIHByb3BlcnRpZXMg
ZGVmaW5lZCwgZGV2aWNlIHRyZWVzIGF0dGVtcHRpbmcgdG8gdXNlIHRoZQpkb2N1bWVudGVkIEdQ
SU8gY2FwYWJpbGl0aWVzIHdpbGwgYmUgc3RyaWN0bHkgcmVqZWN0ZWQgZHVlIHRvCnVuZXZhbHVh
dGVkUHJvcGVydGllczogZmFsc2UgYXQgdGhlIHRvcCBsZXZlbC4KCj4gKwo+ICtwcm9wZXJ0aWVz
Ogo+ICsgIGNvbXBhdGlibGU6Cj4gKyAgICBjb25zdDogbnhwLHAzaDI4NDAKCltTZXZlcml0eTog
TWVkaXVtXQpUaGUgZGVzY3JpcHRpb24gbWVudGlvbnMgc3VwcG9ydCBmb3IgdGhlIFAzSDI0NDAg
YW5kIFAzSDI0NDEgNC1wb3J0IGhhcmR3YXJlCnZhcmlhbnRzLCBidXQgdGhlIGNvbXBhdGlibGUg
cHJvcGVydHkgaXMgcmVzdHJpY3RlZCBzdHJpY3RseSB0byBueHAscDNoMjg0MC4KU2hvdWxkIHRo
ZSBjb21wYXRpYmxlIHN0cmluZ3MgZm9yIHRoZSA0LXBvcnQgdmFyaWFudHMgYWxzbyBiZSBpbmNs
dWRlZCBoZXJlPwoKWyAuLi4gXQoKPiArcGF0dGVyblByb3BlcnRpZXM6Cj4gKyAgIl5pM2NAWzAt
N10kIjoKPiArICAgIHR5cGU6IG9iamVjdAo+ICsgICAgJHJlZjogL3NjaGVtYXMvaTNjL2kzYy55
YW1sIwo+ICsgICAgdW5ldmFsdWF0ZWRQcm9wZXJ0aWVzOiBmYWxzZQo+ICsKPiArICAgIHByb3Bl
cnRpZXM6Cj4gKyAgICAgIHJlZzoKPiArICAgICAgICBkZXNjcmlwdGlvbjoKPiArICAgICAgICAg
IFRoZSBJM0MgSFVCIFRhcmdldCBQb3J0IG51bWJlci4KPiArICAgICAgICBtYXhpbXVtOiA3Cgpb
U2V2ZXJpdHk6IE1lZGl1bV0KVGhlIG1heGltdW0gcG9ydCBudW1iZXIgaXMgY3VycmVudGx5IGhh
cmRjb2RlZCB0byA3IGZvciBhbGwgdmFyaWFudHMuIElmIHRoZQo0LXBvcnQgdmFyaWFudHMgKFAz
SDI0NDAvUDNIMjQ0MSkgYXJlIHN1cHBvcnRlZCwgd291bGRuJ3Qgd2UgbmVlZCBjb25kaXRpb25h
bAppZi10aGVuIGNvbnN0cmFpbnRzIHRvIHJlc3RyaWN0IHRoZSByZWcgbWF4aW11bSB0byAzIGZv
ciB0aGUgNC1wb3J0IGh1YnM/Ck90aGVyd2lzZSwgaW52YWxpZCBkZXZpY2UgdHJlZXMgZGVmaW5p
bmcgbm9uLWV4aXN0ZW50IHBvcnRzIG9uIDQtcG9ydCBodWJzCm1pZ2h0IHBhc3MgdmFsaWRhdGlv
bi4KCi0tIApTYXNoaWtvIEFJIHJldmlldyDCtyBodHRwczovL3Nhc2hpa28uZGV2LyMvcGF0Y2hz
ZXQvMjAyNjA2MTIxMTE4MTYuMzY4ODI0MC0xLWxha3NoYXkucGlwbGFuaUBueHAuY29tP3BhcnQ9
NAoKLS0gCmxpbnV4LWkzYyBtYWlsaW5nIGxpc3QKbGludXgtaTNjQGxpc3RzLmluZnJhZGVhZC5v
cmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1pM2MK
