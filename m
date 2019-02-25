Return-Path: <SRS0=XpnT=RA=lists.infradead.org=linux-i3c-bounces+linux-i3c=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 67C75C43381
	for <linux-i3c@archiver.kernel.org>; Mon, 25 Feb 2019 13:10:37 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3089C20842
	for <linux-i3c@archiver.kernel.org>; Mon, 25 Feb 2019 13:10:37 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="nDGH+t4G"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3089C20842
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=A2A+MUcKQErfNWnQNYYxo+O2m7u1gocn8sg3h8g1RXM=; b=nDGH+t4GSiQv/J
	Uf1IqEl5HansZitaoFlfis7pRFLrl0BWHu/h5Rk+L3ZbRIf3lqOjMe++av/E2BrjS4Iq2UuS67Ngq
	dXuuByrKcX/mTsA2QO6+4M/fvdkOB011Ei9BCKNkLhdQGk/wiB2tALtdK1A79bHJKCKi9UsZqRLul
	z6k6lQwqcA4CfTW2kILm42XRn49t8d6aGSLOQrTvXGVwN3/IK5msOiVTS8uzQabXUr4QUmGc+4fC0
	sEfcOnI5hJyMBblylGo+SI2jy8voqLt/Wk6Jbt+8gek/T6wqP3PYn1hvfgEJwmLZ1bBH0EVgA+Drn
	cvNrq/BcBz801scb04qA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gyG1k-00067y-OW; Mon, 25 Feb 2019 13:10:36 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gyG1h-00067d-JY
 for linux-i3c@lists.infradead.org; Mon, 25 Feb 2019 13:10:35 +0000
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id D9C7328082A;
 Mon, 25 Feb 2019 13:10:31 +0000 (GMT)
Date: Mon, 25 Feb 2019 14:10:29 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: vitor <vitor.soares@synopsys.com>
Subject: Re: [PATCH 1/2] i3c: Add support for HDR modes.
Message-ID: <20190225141029.23afdf11@collabora.com>
In-Reply-To: <6a5570ee-9d40-2c91-4b32-5e030ce94d07@synopsys.com>
References: <cover.1544702829.git.pgaj@cadence.com>
 <efb3b8692d3579ab3369cc0f80e237550f3e8209.1544702829.git.pgaj@cadence.com>
 <cb17ee91-bad8-03d4-cc9f-e7095cf17011@synopsys.com>
 <20190222155238.3dc4ab8f@kernel.org>
 <20190222150248.GA28244@global.cadence.com>
 <a4d2b1b8-f30f-4c12-a7ab-1bd2bccf1666@synopsys.com>
 <20190225095625.36727da7@collabora.com>
 <6a5570ee-9d40-2c91-4b32-5e030ce94d07@synopsys.com>
Organization: Collabora
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190225_051033_903750_E40F1A57 
X-CRM114-Status: GOOD (  27.26  )
X-BeenThere: linux-i3c@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: Linux I3C <linux-i3c.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-i3c>,
 <mailto:linux-i3c-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-i3c/>
List-Post: <mailto:linux-i3c@lists.infradead.org>
List-Help: <mailto:linux-i3c-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-i3c>,
 <mailto:linux-i3c-request@lists.infradead.org?subject=subscribe>
Cc: Przemyslaw Gaj <pgaj@cadence.com>, psroka@cadence.com,
 linux-i3c@lists.infradead.org, rafalc@cadence.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org

T24gTW9uLCAyNSBGZWIgMjAxOSAxMjo1NjozNSArMDAwMAp2aXRvciA8dml0b3Iuc29hcmVzQHN5
bm9wc3lzLmNvbT4gd3JvdGU6Cgo+IE9uIDI1LzAyLzE5IDA4OjU2LCBCb3JpcyBCcmV6aWxsb24g
d3JvdGU6Cj4gPiBIaSBWaXRvcgo+ID4KPiA+IE9uIEZyaSwgMjIgRmViIDIwMTkgMTc6NDE6MzQg
KzAwMDAKPiA+IHZpdG9yIDx2aXRvci5zb2FyZXNAc3lub3BzeXMuY29tPiB3cm90ZToKPiA+ICAK
PiA+PiBPbiAyMi8wMi8xOSAxNTowMiwgUHJ6ZW15c2xhdyBHYWogd3JvdGU6ICAKPiA+Pj4+Pj4g
IHN0cnVjdCBpM2NfaWJpX3BheWxvYWQgewo+ID4+Pj4+PiBkaWZmIC0tZ2l0IGEvaW5jbHVkZS9s
aW51eC9pM2MvbWFzdGVyLmggYi9pbmNsdWRlL2xpbnV4L2kzYy9tYXN0ZXIuaAo+ID4+Pj4+PiBp
bmRleCBhZGE5NTZhLi5mZDUwNDczIDEwMDY0NAo+ID4+Pj4+PiAtLS0gYS9pbmNsdWRlL2xpbnV4
L2kzYy9tYXN0ZXIuaAo+ID4+Pj4+PiArKysgYi9pbmNsdWRlL2xpbnV4L2kzYy9tYXN0ZXIuaAo+
ID4+Pj4+PiBAQCAtMzg2LDYgKzM4NiwxMCBAQCBzdHJ1Y3QgaTNjX2J1cyB7Cj4gPj4+Pj4+ICAg
KgkJICBUaGlzIG1ldGhvZCBpcyBtYW5kYXRvcnkuCj4gPj4+Pj4+ICAgKiBAcHJpdl94ZmVyczog
ZG8gb25lIG9yIHNldmVyYWwgcHJpdmF0ZSBJM0MgU0RSIHRyYW5zZmVycwo+ID4+Pj4+PiAgICoJ
CVRoaXMgbWV0aG9kIGlzIG1hbmRhdG9yeS4KPiA+Pj4+Pj4gKyAqIEBzZW5kX2hkcl9jbWRzOiBz
ZW5kIG9uZSBvciBzZXZlcmFsIEhEUiBjb21tYW5kcy4gSWYgdGhlcmUgaXMgbW9yZSB0aGFuIG9u
ZQo+ID4+Pj4+PiArICoJCSAgIGNvbW1hbmQsIHRoZXkgc2hvdWxkIGlkZWFsbHkgYmUgc2VudCBp
biB0aGUgc2FtZSBIRFIKPiA+Pj4+Pj4gKyAqCQkgICB0cmFuc2FjdGlvbi4KPiA+Pj4+Pj4gKyAq
CQkgICBUaGlzIG1ldGhvZCBpcyBvcHRpb25hbC4KPiA+Pj4+Pj4gICAqIEBhdHRhY2hfaTJjX2Rl
djogY2FsbGVkIGV2ZXJ5IHRpbWUgYW4gSTJDIGRldmljZSBpcyBhdHRhY2hlZCB0byB0aGUgYnVz
Lgo+ID4+Pj4+PiAgICoJCSAgICBUaGlzIGlzIGEgZ29vZCBwbGFjZSB0byBhdHRhY2ggbWFzdGVy
IGNvbnRyb2xsZXIgc3BlY2lmaWMKPiA+Pj4+Pj4gICAqCQkgICAgZGF0YSB0byBJMkMgZGV2aWNl
cy4KPiA+Pj4+Pj4gQEAgLTQ1Nyw2ICs0NjEsOSBAQCBzdHJ1Y3QgaTNjX21hc3Rlcl9jb250cm9s
bGVyX29wcyB7Cj4gPj4+Pj4+ICAJaW50ICgqcHJpdl94ZmVycykoc3RydWN0IGkzY19kZXZfZGVz
YyAqZGV2LAo+ID4+Pj4+PiAgCQkJICBzdHJ1Y3QgaTNjX3ByaXZfeGZlciAqeGZlcnMsCj4gPj4+
Pj4+ICAJCQkgIGludCBueGZlcnMpOwo+ID4+Pj4+PiArCWludCAoKnNlbmRfaGRyX2NtZHMpKHN0
cnVjdCBpM2NfZGV2X2Rlc2MgKmRldiwKPiA+Pj4+Pj4gKwkJCSAgICAgY29uc3Qgc3RydWN0IGkz
Y19oZHJfY21kICpjbWRzLAo+ID4+Pj4+PiArCQkJICAgICBpbnQgbmNtZHMpOwo+ID4+Pj4+PiAg
CWludCAoKmF0dGFjaF9pMmNfZGV2KShzdHJ1Y3QgaTJjX2Rldl9kZXNjICpkZXYpOwo+ID4+Pj4+
PiAgCXZvaWQgKCpkZXRhY2hfaTJjX2Rldikoc3RydWN0IGkyY19kZXZfZGVzYyAqZGV2KTsKPiA+
Pj4+Pj4gIAlpbnQgKCppMmNfeGZlcnMpKHN0cnVjdCBpMmNfZGV2X2Rlc2MgKmRldiwgICAgICAK
PiA+Pj4+PiBXaXRoIHRoaXMgYXBwcm9hY2ggdGhlIGNvbnRyb2xsZXIgYmV0d2VlbiBhIHN0YXJ0
IGFuZCBzdG9wIGNhbiBvbmx5IHRyYW5zbWl0IGluIFNEUiBvciBIRFIuCj4gPj4+Pj4KPiA+Pj4+
PiBUaGlzIGlzIGxpbWl0ZWQgZm9yIGRldmljZXMgdGhhdCBuZWVkIHRoZSBmb2xsb3dpbmcgZnJh
bWU6Cj4gPj4+Pj4gwqDCoMKgIDxTdGFydD48U0RSIHhmZXI+PFJlcGVhdGVkIFN0YXJ0PjxIRFIg
Y29tbWFuZD48U3RvcD4gICAgCj4gPj4+IEFjdHVhbGx5LCB0aGVyZSBpcyByZXBlYXRlZCBzdGFy
dCBiZXR3ZWVuIFNEUiBhbmQgRU5USERSLiBUaGVyZSBpcyBubyByZXBlYXRlZAo+ID4+PiBzdGFy
dCBiZXR3ZWVuIEVOVEhEUiBhbmQgSERSIGNvbW1hbmRzLCBIRFIgY29tbWFuZCBoYXMgdG8gc3Rh
cnQgaW1tZWRldGx5IGFmdGVyCj4gPj4+IEVOVEhEUi4gT2YgY291cnNlLCBoZHIgcmVzdGFydCBt
YXkgb2NjdXIgYmV0d2VlbiBIRFIgY29tbWFuZHMuICAgIAo+ID4+IFNvcnJ5LCBJIG1lYW50IGFs
bCBIRFIgZnJhbWUuICAKPiA+IFRoZW4gdGhlIHByb3Bvc2VkIGludGVyZmFjZSBzaG91bGQgd29y
ayBqdXN0IGZpbmUsIHNpbmNlIHdlIHBhc3MgYW4KPiA+IGFycmF5IG9mIEhEUiBjb21tYW5kcyB0
byBleGVjdXRlLiAgCj4gCj4gSSB0aGluayBpdCBpcyBub3QgY2xlYXIgeWV0LiBXaGVuIEkgcmVm
ZXJyZWQgPEhEUiBjb21tYW5kPiBJIG1lYW50IGFsbCBIRFIgZnJhbWUgKEVOVEhEUngsIEhEUiBj
b21tYW5kLCBIRFIgQ1JDKS4KCkVOVEhEUlggYW5kIENSQyBpcyBhYnN0cmFjdGVkIGF3YXkuIEl0
J3MgdGhlIG1hc3RlciBjb250cm9sbGVyIGRyaXZlcgpyZXNwb25zaWJpbGl0eSB0byBlbnRlciBI
RFIgbW9kZSAodXNpbmcgYSBDQ0MgY29tbWFuZCksIGdlbmVyYXRlIENSQ3MKKGVpdGhlciBpbiBI
VyBvciBpbiBTVykgYW5kIGFkZCBhIEhEUlJFUEVBVCBhZnRlciBlYWNoIEhEUiBmcmFtZSBpZgpu
ZWVkZWQgKGlmIHdlIGhhdmUgbW9yZSB0aGFuIG9uZSBIRFIgY29tbWFuZCB0byBzZW5kKS4KCj4g
Cj4gPj4+PiBJZiB0aGlzIGlzIGEgdXNlIGNhc2Ugd2Ugd2FudCB0byBzdXBwb3J0LCB0aGVuIHdl
IHNob3VsZCBwcm9iYWJseSBoYXZlCj4gPj4+PiBzb21ldGhpbmcgbW9yZSBnZW5lcmljIHRoYW4g
d2hhdCB3ZSBjdXJyZW50bHkgaGF2ZS4KPiA+Pj4+Cj4gPj4+PiBTb21ldGhpbmcgbGlrZQo+ID4+
Pj4KPiA+Pj4+IGVudW0gaTNjX3hmZXJfdHlwZSB7Cj4gPj4+PiAJSTNDX0NDQ19YRkVSLAo+ID4+
Pj4gCUkzQ19TRFJfWEZFUiwKPiA+Pj4+IAlJM0NfSERSX1hGRVIsCj4gPj4+PiB9Cj4gPj4+Pgo+
ID4+Pj4gc3RydWN0IGkzY194ZmVyIHsKPiA+Pj4+IAllbnVtIGkzY194ZmVyX3R5cGUgdHlwZTsK
PiA+Pj4+IAl1bmlvbiB7Cj4gPj4+PiAJCXN0cnVjdCBpM2NfY2NjX2NtZCBjY2M7Cj4gPj4+PiAJ
CXN0cnVjdCBpM2NfcHJpdl94ZmVyIHNkcjsKPiA+Pj4+IAkJc3RydWN0IGkzY19oZHJfY21kIGhk
cjsKPiA+Pj4+IAl9Owo+ID4+Pj4gfSAgICAKPiA+PiBAQm9yaXM6IEkgcmVtZW1iZXIgeW91IGRv
bid0IHdhbnQgdG8gZXhwb3NlIENDQyBjb21tYW5kcywgSSB0aGluayBhdCBsZWFzdCBmb3Igbm93
IHdlIHNob3VsZG4ndCBleHBvc2UgdG9vLgo+ID4+Cj4gPj4gRG8geW91IGFncmVlPyAgCj4gPiBX
ZWxsLCBpZiB3ZSB3YW50IHRvIGhhdmUgYSBnZW5lcmljIGludGVyZmFjZSBhbmQgbm90IGZvcmNl
IGFsbCBkcml2ZXJzCj4gPiB0byBpbXBsZW1lbnQgb25lIGhvb2sgcGVyIHRyYW5zZmVyIHR5cGUs
IHdlIHNob3VsZCBhbHNvIGhhdmUgQ0NDCj4gPiBjb21tYW5kcyBpbiB0aGlzIGVudW0uIFdlIGNh
biBzdGlsbCBtYWtlIHN1cmUgdGhlIHVzZXIgZG9lcyBub3QgcGFzcwo+ID4gQ0NDIGNvbW1hbmRz
IGJlZm9yZSBmb3J3YXJkaW5nIHRoZSByZXF1ZXN0IHRvIHRoZSBjb250cm9sbGVyLiAgCj4gCj4g
SSdtIG9rIHdpdGggdGhpcy4gU3RpbGwgdGhlcmUgaXMgc29tZSBDQ0MgY29tbWFuZHMgdGhhdCBt
aWdodCBiZSBleHBvc2UgZm9yIGRldmljZXMgYW5kIHdlIGNhbiBkZWNpZGUgaXQgbGF0ZXIuCj4g
Cj4gPiBBbnl3YXksIGFzIGZvciBhbGwgdGhlIG90aGVyIGNoYW5nZXMgcHJvcG9zZWQgc28gZmFy
LCBJJ2QgbGlrZSB0byBzZWUgYQo+ID4gcmVhbCB1c2UgY2FzZSBmb3IgdGhpcyBTRFIvSERSWy9D
Q0NdIG1peC4gRG8geW91IGhhdmUgYSBkZXZpY2Ugc3BlYwo+ID4gZGVzY3JpYmluZyBzdWNoIGEg
c2VxdWVuY2U/ICAKPiAKPiBGcm9tIG15IGtub3dsZWRnZSB0aGVyZSBpcyBubyBkZXZpY2VzIEhE
UiBjYXBhYmxlIG9uIHRoZSBtYXJrZXQgdGh1cyBJIGNhbm5vdCBhcmd1ZSB3aXRoIHJlYWwgdXNl
IGNhc2UuCj4gCj4gQnV0IHBlciBpM2Mgc3BlYyB2MS4wIHRoZXJlIGlzIG5vIG1lbnRpb24gdGhh
dCBIRFIgZnJhbWUgc2hhbGwgYmVnaW4gd2l0aCBhIFNUQVJUIGNvbmRpdGlvbiAobm90IFJFUEVB
VEVEIFNUQVJUKS4KPiBTbywgdGhlIHF1ZXN0aW9uIGlzIHdoeSBkbyBub3Qgc3VwcG9ydCBpdCBp
bnN0ZWFkIG9mIGxpbWl0aW5nIGl0PwoKV2VsbCwgYWxsIGRlcGVuZHMgb24gdGhlIGV4dHJhIGNv
bXBsZXhpdHkgdG8gc3VwcG9ydCB0aGlzIGNhc2UuIElmIGl0J3MKc2ltcGxlIGVub3VnaCwgSSB3
b24ndCBjb21wbGFpbi4KCj4gCj4gV2UgZG9uJ3Qga25vdyB0aGUgaW1wbGVtZW50YXRpb24gb2Yg
dGhlIGRldmljZSBhbmQgc29tZSBvZiB0aGVtIG1heWJlIG5lZWQgdGhlIHByZXZpb3VzIHRyYW5z
ZmVyIChpbiBTRFIpIHRvIGRvIHRoZSBuZXh0IG9uZSAoaW4gSERSKS4KCkV4YWN0bHksIHdlIGRv
bid0IGtub3csIHNvIG1heWJlIHdlIHNob3VsZCBqdXN0IHdhaXQgYmVmb3JlIGludHJvZHVjaW5n
CkhEUiBtb2RlLi4uCgo+IAo+IGFuZCBzdXBwb3J0aW5nIGl0IHdlIGFyZSBjb3ZlciBtb3JlIHVz
ZSBjYXNlcy4KCkFyZSB3ZSBldmVuIHN1cmUgYWxsIGNvbnRyb2xsZXJzIHdpbGwgYmUgYWJsZSB0
byBjaGFpbiB0aGluZ3MgbGlrZQp0aGF0PyBGb3IgaW5zdGFuY2UsIGluIGl0J3Mgbm9uLURNQSBt
b2RlLCB0aGUgQ2FkZW5jZSBjb250cm9sbGVyIGlzCmxpbWl0ZWQgYnkgdGhlIEZJRk8gc2l6ZSwg
d2hpY2ggbWVhbnMgeW91IGFueXdheSB3b24ndCBiZSBhYmxlIHRvCmNoYWluIHRvbyBtdWNoIGZy
YW1lcyB1c2luZyBhIFJFUEVBVEVEIFNUQVJULiBTbywgYW55IGRldmljZSByZWx5aW5nIG9uClJF
UEVBVEVEIFNUQVJUIGZvciBhdG9taWMgc2VxdWVuY2VzIGlzIHVubGlrZWx5IHRvIHdvcmsgd2l0
aCBhbGwgbWFzdGVyCmNvbnRyb2xsZXJzLgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KbGludXgtaTNjIG1haWxpbmcgbGlzdApsaW51eC1pM2NAbGlzdHMu
aW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2xpbnV4LWkzYwo=
