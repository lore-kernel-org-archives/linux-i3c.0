Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F24E6C83F1A
	for <linux-i3c@archiver.kernel.org>; Sun, 20 Jul 2025 23:27:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DKCtVDpMTaIp61X8XS46RjDP1Kb56kqFa4EX6FLRf4Q=; b=EHXUEhcgTtam/X
	6+hLA5lPCLnyhc+hAA2/XZABSC8c6xvjVeuP+/AEqK3lIlDlsFgpP1MIPRUYVw/+XqLZE+ywnnRna
	p4qF0G0DRNY0M+xN6fsfFDJCFVQmiCjhjYoBQi/fWxO+GSxvS9JihhSo2oat25HpunlH6MBMqixKK
	CbLcL/QGvd/3fcHF4k2uSUYNj9+l0u7Od0RajzEYkL4c+wOh3htBYoxdIu1xBiWDtRNlYjzAPuXCS
	WfABL0m+8Vi3cNTNXzFn0vRkePiaF2wmGDbQjOkaov8KG8bavPqNHSI1pdNqJBog3zN+N4HI/iami
	YnStn+Bw63ipk7lES5ug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uddRM-0000000FpTD-2Nw6;
	Sun, 20 Jul 2025 23:27:32 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uddRK-0000000FpT7-49vu
	for linux-i3c@lists.infradead.org;
	Sun, 20 Jul 2025 23:27:31 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 5CCAF60054;
	Sun, 20 Jul 2025 23:27:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 851D2C4CEE7;
	Sun, 20 Jul 2025 23:27:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753054047;
	bh=Kp8wb7K590ryA6q3+0fGUzS4UK4ZiBYQOTjHZtSIW6k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tqxzyVls72ujIUH0TfZiBBXI9npEj3OTs4/nKAEFWnp1JgrC1B42pKi/1ZoVTCr8a
	 3faW3aTsf2/RbbqBd/IQstTYFBWT8nrxTdfoYFsc0f3fY/Uu3BGXJtMk0Ig5EhExdb
	 TJhoMXiKQrkjdVg4IjL64T9bmZqJdGD1JtRVmtJOT+zzJuvWOAqC6OSURMt86Um5IK
	 aLv/wGwywC2qm02YXNt806xjgeAhlPk8GQqHeIJQxDNv+iJg9z5EZ2YsL0Dv90E909
	 0odZB/oWaQRRxOlG+eN81tSVgryN6cX1a9GXfM4yq3d4QCJNmObop6rmveWw6BNTJp
	 +vHouUaK09HvQ==
Date: Sun, 20 Jul 2025 18:27:26 -0500
From: Rob Herring <robh@kernel.org>
To: Jorge Marques <jorge.marques@analog.com>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Frank Li <Frank.Li@nxp.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-i3c@lists.infradead.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	gastmaier@gmail.com
Subject: Re: [PATCH v6 1/2] dt-bindings: i3c: Add adi-i3c-master
Message-ID: <20250720232726.GA3055763-robh@kernel.org>
References: <20250717-adi-i3c-master-v6-0-6c687ed71bed@analog.com>
 <20250717-adi-i3c-master-v6-1-6c687ed71bed@analog.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250717-adi-i3c-master-v6-1-6c687ed71bed@analog.com>
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

T24gVGh1LCBKdWwgMTcsIDIwMjUgYXQgMDk6MDk6MjBBTSArMDIwMCwgSm9yZ2UgTWFycXVlcyB3
cm90ZToKPiBBZGQgYmluZGluZ3MgZG9jIGZvciBBREkgSTNDIENvbnRyb2xsZXIgSVAgY29yZSwg
YSBGUEdBIHN5bnRoZXNpemFibGUgSVAKPiBjb3JlIHRoYXQgaW1wbGVtZW50cyB0aGUgTUlQSSBJ
M0MgQmFzaWMgY29udHJvbGxlciBzcGVjaWZpY2F0aW9uLgo+IAo+IFNpZ25lZC1vZmYtYnk6IEpv
cmdlIE1hcnF1ZXMgPGpvcmdlLm1hcnF1ZXNAYW5hbG9nLmNvbT4KPiAtLS0KPiAgLi4uL2Rldmlj
ZXRyZWUvYmluZGluZ3MvaTNjL2FkaSxpM2MtbWFzdGVyLnlhbWwgICAgfCA2NyArKysrKysrKysr
KysrKysrKysrKysrCj4gIE1BSU5UQUlORVJTICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgIHwgIDUgKysKPiAgMiBmaWxlcyBjaGFuZ2VkLCA3MiBpbnNlcnRpb25zKCspCj4g
Cj4gZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9pM2MvYWRp
LGkzYy1tYXN0ZXIueWFtbCBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9pM2Mv
YWRpLGkzYy1tYXN0ZXIueWFtbAo+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0Cj4gaW5kZXggMDAwMDAw
MDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMC4uOGY1MzIzODZkZTJjMDVkM2Q1MTRk
NDFmZjRkNmEzN2VjODQwNjc0Ywo+IC0tLSAvZGV2L251bGwKPiArKysgYi9Eb2N1bWVudGF0aW9u
L2RldmljZXRyZWUvYmluZGluZ3MvaTNjL2FkaSxpM2MtbWFzdGVyLnlhbWwKPiBAQCAtMCwwICsx
LDY3IEBACj4gKyMgU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IEdQTC0yLjAtb25seSBPUiBCU0Qt
Mi1DbGF1c2UKPiArJVlBTUwgMS4yCj4gKy0tLQo+ICskaWQ6IGh0dHA6Ly9kZXZpY2V0cmVlLm9y
Zy9zY2hlbWFzL2kzYy9hZGksaTNjLW1hc3Rlci55YW1sIwo+ICskc2NoZW1hOiBodHRwOi8vZGV2
aWNldHJlZS5vcmcvbWV0YS1zY2hlbWFzL2NvcmUueWFtbCMKPiArCj4gK3RpdGxlOiBBbmFsb2cg
RGV2aWNlcyBJM0MgQ29udHJvbGxlcgo+ICsKPiArZGVzY3JpcHRpb246IHwKPiArICBGUEdBLWJh
c2VkIEkzQyBjb250cm9sbGVyIGRlc2lnbmVkIHRvIGludGVyZmFjZSB3aXRoIEkzQyBhbmQgSTJD
IHBlcmlwaGVyYWxzLAo+ICsgIGltcGxlbWVudGluZyBhIHN1YnNldCBvZiB0aGUgSTNDLWJhc2lj
IHNwZWNpZmljYXRpb24uIFRoZSBJUCBjb3JlIGlzIHRlc3RlZAo+ICsgIG9uIGFybSwgbWljcm9i
bGF6ZSwgYW5kIGFybTY0IGFyY2hpdGVjdHVyZXMuCj4gKwo+ICsgIGh0dHBzOi8vYW5hbG9nZGV2
aWNlc2luYy5naXRodWIuaW8vaGRsL2xpYnJhcnkvaTNjX2NvbnRyb2xsZXIKPiArCj4gK21haW50
YWluZXJzOgo+ICsgIC0gSm9yZ2UgTWFycXVlcyA8am9yZ2UubWFycXVlc0BhbmFsb2cuY29tPgo+
ICsKPiArcHJvcGVydGllczoKPiArICBjb21wYXRpYmxlOgo+ICsgICAgY29uc3Q6IGFkaSxpM2Mt
bWFzdGVyLXYxCgpJZiB5b3Ugd2FudCB0byB1c2UgdmVyc2lvbiBudW1iZXJzLCB0aGV5IG5lZWQg
dG8gY29ycmVsYXRlIHRvIHNvbWV0aGluZyAKYW5kIHlvdSBuZWVkIHRvIGRvY3VtZW50IHdoYXQg
dGhhdCBpcy4gSSBkb24ndCBzZWUgYW55dGhpbmcgaW4gdGhlIGFib3ZlIApsaW5rIGFib3V0IGEg
dmVyc2lvbiAxLiBLaW5kIG9mIGZlZWxzIGxpa2UgeW91IGp1c3QgbWFkZSBpdCB1cC4KCj4gKwo+
ICsgIHJlZzoKPiArICAgIG1heEl0ZW1zOiAxCj4gKwo+ICsgIGNsb2NrczoKPiArICAgIG1pbkl0
ZW1zOiAxCj4gKyAgICBpdGVtczoKPiArICAgICAgLSBkZXNjcmlwdGlvbjogVGhlIEFYSSBpbnRl
cmNvbm5lY3QgY2xvY2ssIGRyaXZlcyB0aGUgcmVnaXN0ZXIgbWFwLgo+ICsgICAgICAtIGRlc2Ny
aXB0aW9uOiBUaGUgSTNDIGNvbnRyb2xsZXIgY2xvY2suIEFYSSBjbG9jayBkcml2ZXMgYWxsIGxv
Z2ljIGlmIG5vdCBwcm92aWRlZC4KCklzIHRoYXQgYSBkZXNjcmlwdGlvbiBvZiBob3cgdGhlIGgv
dyB3b3Jrcz8gVGhlIGNvbnRyb2xsZXIgY2xvY2sgaW5wdXQgCmNhbiBsaXRlcmFsbHkgYmUgbGVm
dCBkaXNjb25uZWN0ZWQ/IElmIDEgY2xvY2sgc291cmNlIGRyaXZlcyBib3RoIAppbnB1dHMsIHRo
ZW4gdGhlIGJpbmRpbmcgc2hvdWxkIHJlZmxlY3QgdGhhdC4KCj4gKwo+ICsgIGNsb2NrLW5hbWVz
Ogo+ICsgICAgbWluSXRlbXM6IDEKPiArICAgIGl0ZW1zOgo+ICsgICAgICAtIGNvbnN0OiBheGkK
PiArICAgICAgLSBjb25zdDogaTNjCj4gKwo+ICsgIGludGVycnVwdHM6Cj4gKyAgICBtYXhJdGVt
czogMQo+ICsKPiArcmVxdWlyZWQ6Cj4gKyAgLSBjb21wYXRpYmxlCj4gKyAgLSByZWcKPiArICAt
IGNsb2Nrcwo+ICsgIC0gY2xvY2stbmFtZXMKPiArICAtIGludGVycnVwdHMKPiArCj4gK2FsbE9m
Ogo+ICsgIC0gJHJlZjogaTNjLnlhbWwjCj4gKwo+ICt1bmV2YWx1YXRlZFByb3BlcnRpZXM6IGZh
bHNlCj4gKwo+ICtleGFtcGxlczoKPiArICAtIHwKPiArICAgICNpbmNsdWRlIDxkdC1iaW5kaW5n
cy9pbnRlcnJ1cHQtY29udHJvbGxlci9pcnEuaD4KPiArCj4gKyAgICBpM2NANDRhMDAwMDAgewo+
ICsgICAgICAgIGNvbXBhdGlibGUgPSAiYWRpLGkzYy1tYXN0ZXItdjEiOwo+ICsgICAgICAgIHJl
ZyA9IDwweDQ0YTAwMDAwIDB4MTAwMD47Cj4gKyAgICAgICAgaW50ZXJydXB0cyA9IDwzIElSUV9U
WVBFX0xFVkVMX0hJR0g+Owo+ICsgICAgICAgIGNsb2NrcyA9IDwmY2xrYyAxNT4sIDwmY2xrYyAx
NT47Cj4gKyAgICAgICAgY2xvY2stbmFtZXMgPSAiYXhpIiwgImkzYyI7Cj4gKyAgICAgICAgI2Fk
ZHJlc3MtY2VsbHMgPSA8Mz47Cj4gKyAgICAgICAgI3NpemUtY2VsbHMgPSA8MD47Cj4gKwo+ICsg
ICAgICAgIC8qIEkzQyBhbmQgSTJDIGRldmljZXMgKi8KPiArICAgIH07Cj4gZGlmZiAtLWdpdCBh
L01BSU5UQUlORVJTIGIvTUFJTlRBSU5FUlMKPiBpbmRleCBkNWExNzNlOTg3YzA2ZDc1ODQ4ZDEx
MjMzOWUzOTk2NmYyYjcxY2VhLi4xZjIxMjUyOTI3NmY0YWIyOGY0YjdkMTZiNDEwNWE4Y2Y5ZmY1
ZTJlIDEwMDY0NAo+IC0tLSBhL01BSU5UQUlORVJTCj4gKysrIGIvTUFJTlRBSU5FUlMKPiBAQCAt
MTE0NTIsNiArMTE0NTIsMTEgQEAgUzoJTWFpbnRhaW5lZAo+ICBGOglEb2N1bWVudGF0aW9uL2Rl
dmljZXRyZWUvYmluZGluZ3MvaTNjL2FzcGVlZCxhc3QyNjAwLWkzYy55YW1sCj4gIEY6CWRyaXZl
cnMvaTNjL21hc3Rlci9hc3QyNjAwLWkzYy1tYXN0ZXIuYwo+ICAKPiArSTNDIERSSVZFUiBGT1Ig
QU5BTE9HIERFVklDRVMgSTNDIENPTlRST0xMRVIgSVAKPiArTToJSm9yZ2UgTWFycXVlcyA8am9y
Z2UubWFycXVlc0BhbmFsb2cuY29tPgo+ICtTOglNYWludGFpbmVkCj4gK0Y6CURvY3VtZW50YXRp
b24vZGV2aWNldHJlZS9iaW5kaW5ncy9pM2MvYWRpLGkzYy1tYXN0ZXIueWFtbAo+ICsKPiAgSTND
IERSSVZFUiBGT1IgQ0FERU5DRSBJM0MgTUFTVEVSIElQCj4gIE06CVByemVteXPFgmF3IEdhaiA8
cGdhakBjYWRlbmNlLmNvbT4KPiAgUzoJTWFpbnRhaW5lZAo+IAo+IC0tIAo+IDIuNDkuMAo+IAoK
LS0gCmxpbnV4LWkzYyBtYWlsaW5nIGxpc3QKbGludXgtaTNjQGxpc3RzLmluZnJhZGVhZC5vcmcK
aHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1pM2MK
