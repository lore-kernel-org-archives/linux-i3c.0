Return-Path: <SRS0=UjAo=VJ=lists.infradead.org=linux-i3c-bounces+linux-i3c=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 39225C742D2
	for <linux-i3c@archiver.kernel.org>; Fri, 12 Jul 2019 20:03:29 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0E7F6217D4
	for <linux-i3c@archiver.kernel.org>; Fri, 12 Jul 2019 20:03:28 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="aMseaY8H"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0E7F6217D4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zqmX/dhGCOm1fEL06yNHTWGBLaIC7axnXwj1QgIYblE=; b=aMseaY8HgjOEvY
	uc6WKVEXHwLtAG3XV0nvHDBO0rv5PKrLgxGDKvtI9OOPL+KKbgy4mW0dxpGZt4v/e/ysSV+7i7sE/
	06CEjL8hhh9Ih9wnCPc0D/bak76dDa+lOw9fs2Fg6t30cYnA8v5oIfUC7c2s0/gkXIZV/LPDUBU/K
	GWXoJRCtAtmFsV2mjxwgQPpsE8mhN7pqwbS/g6KLQck+yO6/KIVfan/a6Nq6uYBqIxhlR8evfYrmI
	zOgrAJuZJU1E49zZPsQtdg+1xQZPFezME2CpQGRgs0esYp/C/dliGBrIxQkwvgB8W67CSRUObkV/7
	KCfbjXSbSpfaqsSfF8MA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hm1lQ-00028G-Io; Fri, 12 Jul 2019 20:03:28 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hm1lM-00027n-Vg
 for linux-i3c@lists.infradead.org; Fri, 12 Jul 2019 20:03:26 +0000
Received: from pc-381.home
 (2a01cb0c80061e00e835b5cf688fec09.ipv6.abo.wanadoo.fr
 [IPv6:2a01:cb0c:8006:1e00:e835:b5cf:688f:ec09])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id D34D428BC69;
 Fri, 12 Jul 2019 21:03:22 +0100 (BST)
Date: Fri, 12 Jul 2019 22:03:20 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Vitor Soares <Vitor.Soares@synopsys.com>
Subject: Re: [PATCH v4 3/3] iio: imu: st_lsm6dsx: add i3c basic support for
 LSM6DSO and LSM6DSR
Message-ID: <20190712220320.50e7cfff@pc-381.home>
In-Reply-To: <SN6PR12MB2655C68059719693C7EFF05CAEF20@SN6PR12MB2655.namprd12.prod.outlook.com>
References: <cover.1562931742.git.vitor.soares@synopsys.com>
 <f239834a6b8bd179094cdc19a3ac5ecaf807cee3.1562931742.git.vitor.soares@synopsys.com>
 <20190712181332.04f8b3da@linux.home>
 <SN6PR12MB26553046898233A094DCC952AEF20@SN6PR12MB2655.namprd12.prod.outlook.com>
 <20190712184323.28547c44@pc-381.home>
 <SN6PR12MB2655C68059719693C7EFF05CAEF20@SN6PR12MB2655.namprd12.prod.outlook.com>
Organization: Collabora
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190712_130325_287718_1F85FD90 
X-CRM114-Status: GOOD (  27.86  )
X-BeenThere: linux-i3c@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux I3C <linux-i3c.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-i3c>,
 <mailto:linux-i3c-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-i3c/>
List-Post: <mailto:linux-i3c@lists.infradead.org>
List-Help: <mailto:linux-i3c-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-i3c>,
 <mailto:linux-i3c-request@lists.infradead.org?subject=subscribe>
Cc: "Joao.Pinto@synopsys.com" <Joao.Pinto@synopsys.com>,
 "rafael@kernel.org" <rafael@kernel.org>,
 "linux-iio@vger.kernel.org" <linux-iio@vger.kernel.org>,
 "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
 "bbrezillon@kernel.org" <bbrezillon@kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-i3c@lists.infradead.org" <linux-i3c@lists.infradead.org>,
 "lorenzo@kernel.org" <lorenzo@kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org

T24gRnJpLCAxMiBKdWwgMjAxOSAxODo0MDoxNCArMDAwMApWaXRvciBTb2FyZXMgPFZpdG9yLlNv
YXJlc0BzeW5vcHN5cy5jb20+IHdyb3RlOgoKPiBGcm9tOiBCb3JpcyBCcmV6aWxsb24gPGJvcmlz
LmJyZXppbGxvbkBjb2xsYWJvcmEuY29tPgo+IERhdGU6IEZyaSwgSnVsIDEyLCAyMDE5IGF0IDE3
OjQzOjIzCj4gCj4gPiBPbiBGcmksIDEyIEp1bCAyMDE5IDE2OjI4OjAyICswMDAwCj4gPiBWaXRv
ciBTb2FyZXMgPFZpdG9yLlNvYXJlc0BzeW5vcHN5cy5jb20+IHdyb3RlOgo+ID4gICAKPiA+ID4g
RnJvbTogQm9yaXMgQnJlemlsbG9uIDxib3Jpcy5icmV6aWxsb25AY29sbGFib3JhLmNvbT4KPiA+
ID4gRGF0ZTogRnJpLCBKdWwgMTIsIDIwMTkgYXQgMTc6MTQ6MjkKPiA+ID4gICAKPiA+ID4gPiBP
biBGcmksIDEyIEp1bCAyMDE5IDEzOjUzOjMwICswMjAwCj4gPiA+ID4gVml0b3IgU29hcmVzIDxW
aXRvci5Tb2FyZXNAc3lub3BzeXMuY29tPiB3cm90ZToKPiA+ID4gPiAgICAgCj4gPiA+ID4gPiBG
b3IgdG9kYXkgdGhlIHN0X2xzbTZkc3ggZHJpdmVyIHN1cHBvcnQgTFNNNkRTTyBhbmQgTFNNNkRT
UiBzZW5zb3Igb25seSBpbgo+ID4gPiA+ID4gc3BpIGFuZCBpMmMgbW9kZS4KPiA+ID4gPiA+IAo+
ID4gPiA+ID4gVGhlIExTTTZEU08gYW5kIExTTTZEU1IgYXJlIGFsc28gaTNjIGNhcGFibGUgc28g
bGV0cyBnaXZlIGkzYyBzdXBwb3J0IHRvCj4gPiA+ID4gPiB0aGVtLgo+ID4gPiA+ID4gCj4gPiA+
ID4gPiBTaWduZWQtb2ZmLWJ5OiBWaXRvciBTb2FyZXMgPHZpdG9yLnNvYXJlc0BzeW5vcHN5cy5j
b20+Cj4gPiA+ID4gPiBBY2tlZC1ieTogTG9yZW56byBCaWFuY29uaSA8bG9yZW56b0BrZXJuZWwu
b3JnPgo+ID4gPiA+ID4gLS0tCj4gPiA+ID4gPiBDaGFuZ2VzIGluIHY0Ogo+ID4gPiA+ID4gICBS
ZW1vdmUgaHdfaWQgdmFyaWFibGUKPiA+ID4gPiA+IAo+ID4gPiA+ID4gQ2hhbmdlcyBpbiB2MzoK
PiA+ID4gPiA+ICAgUmVtb3ZlIHVubmVjZXNzYXJ5IHN0X2xzbTZkc3hfaTNjX2RhdGEgdGFibGUg
dXNlZCB0byBob2xkIGRldmljZSBuYW1lCj4gPiA+ID4gPiAgIFVzZSBzdF9sc202ZHN4X3Byb2Jl
IG5ldyBmb3JtCj4gPiA+ID4gPiAKPiA+ID4gPiA+IENoYW5nZXMgaW4gdjI6Cj4gPiA+ID4gPiAg
IEFkZCBzdXBwb3J0IGZvciBMU002RFNSCj4gPiA+ID4gPiAgIFNldCBwbV9vcHMgdG8gc3RfbHNt
NmRzeF9wbV9vcHMKPiA+ID4gPiA+IAo+ID4gPiA+ID4gIGRyaXZlcnMvaWlvL2ltdS9zdF9sc202
ZHN4L0tjb25maWcgICAgICAgICAgfCAgOCArKystCj4gPiA+ID4gPiAgZHJpdmVycy9paW8vaW11
L3N0X2xzbTZkc3gvTWFrZWZpbGUgICAgICAgICB8ICAxICsKPiA+ID4gPiA+ICBkcml2ZXJzL2lp
by9pbXUvc3RfbHNtNmRzeC9zdF9sc202ZHN4X2kzYy5jIHwgNTggKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysKPiA+ID4gPiA+ICAzIGZpbGVzIGNoYW5nZWQsIDY2IGluc2VydGlvbnMoKyks
IDEgZGVsZXRpb24oLSkKPiA+ID4gPiA+ICBjcmVhdGUgbW9kZSAxMDA2NDQgZHJpdmVycy9paW8v
aW11L3N0X2xzbTZkc3gvc3RfbHNtNmRzeF9pM2MuYwo+ID4gPiA+ID4gCj4gPiA+ID4gPiBkaWZm
IC0tZ2l0IGEvZHJpdmVycy9paW8vaW11L3N0X2xzbTZkc3gvS2NvbmZpZyBiL2RyaXZlcnMvaWlv
L2ltdS9zdF9sc202ZHN4L0tjb25maWcKPiA+ID4gPiA+IGluZGV4IDllNTkyOTcuLjZiNWE3M2Mg
MTAwNjQ0Cj4gPiA+ID4gPiAtLS0gYS9kcml2ZXJzL2lpby9pbXUvc3RfbHNtNmRzeC9LY29uZmln
Cj4gPiA+ID4gPiArKysgYi9kcml2ZXJzL2lpby9pbXUvc3RfbHNtNmRzeC9LY29uZmlnCj4gPiA+
ID4gPiBAQCAtMSwxMSArMSwxMiBAQAo+ID4gPiA+ID4gIAo+ID4gPiA+ID4gIGNvbmZpZyBJSU9f
U1RfTFNNNkRTWAo+ID4gPiA+ID4gIAl0cmlzdGF0ZSAiU1RfTFNNNkRTeCBkcml2ZXIgZm9yIFNU
TSA2LWF4aXMgSU1VIE1FTVMgc2Vuc29ycyIKPiA+ID4gPiA+IC0JZGVwZW5kcyBvbiAoSTJDIHx8
IFNQSSkKPiA+ID4gPiA+ICsJZGVwZW5kcyBvbiAoSTJDIHx8IFNQSSB8fCBJM0MpCj4gPiA+ID4g
PiAgCXNlbGVjdCBJSU9fQlVGRkVSCj4gPiA+ID4gPiAgCXNlbGVjdCBJSU9fS0ZJRk9fQlVGCj4g
PiA+ID4gPiAgCXNlbGVjdCBJSU9fU1RfTFNNNkRTWF9JMkMgaWYgKEkyQykKPiA+ID4gPiA+ICAJ
c2VsZWN0IElJT19TVF9MU002RFNYX1NQSSBpZiAoU1BJX01BU1RFUikKPiA+ID4gPiA+ICsJc2Vs
ZWN0IElJT19TVF9MU002RFNYX0kzQyBpZiAoSTNDKQo+ID4gPiA+ID4gIAloZWxwCj4gPiA+ID4g
PiAgCSAgU2F5IHllcyBoZXJlIHRvIGJ1aWxkIHN1cHBvcnQgZm9yIFNUTWljcm9lbGVjdHJvbmlj
cyBMU002RFN4IGltdQo+ID4gPiA+ID4gIAkgIHNlbnNvci4gU3VwcG9ydGVkIGRldmljZXM6IGxz
bTZkczMsIGxzbTZkczNoLCBsc202ZHNsLCBsc202ZHNtLAo+ID4gPiA+ID4gQEAgLTIzLDMgKzI0
LDggQEAgY29uZmlnIElJT19TVF9MU002RFNYX1NQSQo+ID4gPiA+ID4gIAl0cmlzdGF0ZQo+ID4g
PiA+ID4gIAlkZXBlbmRzIG9uIElJT19TVF9MU002RFNYCj4gPiA+ID4gPiAgCXNlbGVjdCBSRUdN
QVBfU1BJCj4gPiA+ID4gPiArCj4gPiA+ID4gPiArY29uZmlnIElJT19TVF9MU002RFNYX0kzQwo+
ID4gPiA+ID4gKwl0cmlzdGF0ZQo+ID4gPiA+ID4gKwlkZXBlbmRzIG9uIElJT19TVF9MU002RFNY
Cj4gPiA+ID4gPiArCXNlbGVjdCBSRUdNQVBfSTNDCj4gPiA+ID4gPiBkaWZmIC0tZ2l0IGEvZHJp
dmVycy9paW8vaW11L3N0X2xzbTZkc3gvTWFrZWZpbGUgYi9kcml2ZXJzL2lpby9pbXUvc3RfbHNt
NmRzeC9NYWtlZmlsZQo+ID4gPiA+ID4gaW5kZXggZTVmNzMzYy4uYzY3Njk2NSAxMDA2NDQKPiA+
ID4gPiA+IC0tLSBhL2RyaXZlcnMvaWlvL2ltdS9zdF9sc202ZHN4L01ha2VmaWxlCj4gPiA+ID4g
PiArKysgYi9kcml2ZXJzL2lpby9pbXUvc3RfbHNtNmRzeC9NYWtlZmlsZQo+ID4gPiA+ID4gQEAg
LTQsMyArNCw0IEBAIHN0X2xzbTZkc3gteSA6PSBzdF9sc202ZHN4X2NvcmUubyBzdF9sc202ZHN4
X2J1ZmZlci5vIFwKPiA+ID4gPiA+ICBvYmotJChDT05GSUdfSUlPX1NUX0xTTTZEU1gpICs9IHN0
X2xzbTZkc3gubwo+ID4gPiA+ID4gIG9iai0kKENPTkZJR19JSU9fU1RfTFNNNkRTWF9JMkMpICs9
IHN0X2xzbTZkc3hfaTJjLm8KPiA+ID4gPiA+ICBvYmotJChDT05GSUdfSUlPX1NUX0xTTTZEU1hf
U1BJKSArPSBzdF9sc202ZHN4X3NwaS5vCj4gPiA+ID4gPiArb2JqLSQoQ09ORklHX0lJT19TVF9M
U002RFNYX0kzQykgKz0gc3RfbHNtNmRzeF9pM2Mubwo+ID4gPiA+ID4gZGlmZiAtLWdpdCBhL2Ry
aXZlcnMvaWlvL2ltdS9zdF9sc202ZHN4L3N0X2xzbTZkc3hfaTNjLmMgYi9kcml2ZXJzL2lpby9p
bXUvc3RfbHNtNmRzeC9zdF9sc202ZHN4X2kzYy5jCj4gPiA+ID4gPiBuZXcgZmlsZSBtb2RlIDEw
MDY0NAo+ID4gPiA+ID4gaW5kZXggMDAwMDAwMC4uMmU4OTUyNAo+ID4gPiA+ID4gLS0tIC9kZXYv
bnVsbAo+ID4gPiA+ID4gKysrIGIvZHJpdmVycy9paW8vaW11L3N0X2xzbTZkc3gvc3RfbHNtNmRz
eF9pM2MuYwo+ID4gPiA+ID4gQEAgLTAsMCArMSw1OCBAQAo+ID4gPiA+ID4gKy8vIFNQRFgtTGlj
ZW5zZS1JZGVudGlmaWVyOiBHUEwtMi4wCj4gPiA+ID4gPiArLyoKPiA+ID4gPiA+ICsgKiBDb3B5
cmlnaHQgKGMpIDIwMTggU3lub3BzeXMsIEluYy4gYW5kL29yIGl0cyBhZmZpbGlhdGVzLgo+ID4g
PiA+ID4gKyAqCj4gPiA+ID4gPiArICogQXV0aG9yOiBWaXRvciBTb2FyZXMgPHZpdG9yLnNvYXJl
c0BzeW5vcHN5cy5jb20+Cj4gPiA+ID4gPiArICovCj4gPiA+ID4gPiArCj4gPiA+ID4gPiArI2lu
Y2x1ZGUgPGxpbnV4L2tlcm5lbC5oPgo+ID4gPiA+ID4gKyNpbmNsdWRlIDxsaW51eC9tb2R1bGUu
aD4KPiA+ID4gPiA+ICsjaW5jbHVkZSA8bGludXgvaTNjL2RldmljZS5oPgo+ID4gPiA+ID4gKyNp
bmNsdWRlIDxsaW51eC9pM2MvbWFzdGVyLmg+Cj4gPiA+ID4gPiArI2luY2x1ZGUgPGxpbnV4L3Ns
YWIuaD4KPiA+ID4gPiA+ICsjaW5jbHVkZSA8bGludXgvb2YuaD4KPiA+ID4gPiA+ICsjaW5jbHVk
ZSA8bGludXgvcmVnbWFwLmg+Cj4gPiA+ID4gPiArCj4gPiA+ID4gPiArI2luY2x1ZGUgInN0X2xz
bTZkc3guaCIKPiA+ID4gPiA+ICsKPiA+ID4gPiA+ICtzdGF0aWMgY29uc3Qgc3RydWN0IGkzY19k
ZXZpY2VfaWQgc3RfbHNtNmRzeF9pM2NfaWRzW10gPSB7Cj4gPiA+ID4gPiArCUkzQ19ERVZJQ0Uo
MHgwMTA0LCAweDAwNkMsICh2b2lkICopU1RfTFNNNkRTT19JRCksCj4gPiA+ID4gPiArCUkzQ19E
RVZJQ0UoMHgwMTA0LCAweDAwNkIsICh2b2lkICopU1RfTFNNNkRTUl9JRCksICAgIAo+ID4gPiA+
IAo+ID4gPiA+IEkgdGhpbmsgeW91IG5lZWQgYW4gdWludHB0cl90IGNhc3QgaGVyZToKPiA+ID4g
PiAKPiA+ID4gPiAJSTNDX0RFVklDRSgweDAxMDQsIDB4MDA2QywgKHZvaWQgKikodWludHB0cl90
KVNUX0xTTTZEU09fSUQpLAo+ID4gPiA+IAlJM0NfREVWSUNFKDB4MDEwNCwgMHgwMDZCLCAodm9p
ZCAqKSh1aW50cHRyX3QpU1RfTFNNNkRTUl9JRCksCj4gPiA+ID4gCj4gPiA+ID4gb3RoZXJ3aXNl
IGdjYyBtaWdodCBjb21wbGFpbiB0aGF0IHRoZSBpbnRlZ2VyIGFuZCBwb2ludGVyIGRvIG5vdCBo
YXZlCj4gPiA+ID4gdGhlIHNhbWUgc2l6ZSAob24gNjQtYml0IGFyY2hpdGVjdHVyZXMpLiAgICAK
PiA+ID4gCj4gPiA+IEkgZG9uJ3QgdW5kZXJzdGFuZCB0aGlzIHBhcnQuIENhbiB5b3UgcHJvdmlk
ZSBvciBwb2ludCBzb21lIGJhY2tncm91bmQ/ICAKPiA+IAo+ID4gSWYgeW91IGRvbid0IGRvIHRo
YXQgeW91J2xsIGdldCB0aGUgZm9sbG93aW5nIHdhcm5pbmc6Cj4gPiAKPiA+IAl3YXJuaW5nOiBj
YXN0IHRvICd2b2lkIConIGZyb20gc21hbGxlciBpbnRlZ2VyIHR5cGUgJ2ludCcgWy1XaW50LXRv
LXZvaWQtcG9pbnRlci1jYXN0XSAgCj4gCj4gSSBkb24ndCBnZXQgdGhlIHdhcm5pbmcgZHVyaW5n
IGNvbXBpbGF0aW9uLiBJcyB0aGVyZSBhbnkgZmxhZyB0byBlbmFibGUgCj4gb3Igc28/CgpOb3Bl
LCBub3RoaW5nIHNwZWNpZmljIHRvIGVuYWJsZSwganVzdCBlbmFibGUgdGhpcyBkcml2ZXIgb24g
YW4gYXJtNjQKY29uZmlnLiBOb3RlIHRoYXQgdGhhdCBnY2MgZG9lc24ndCBzZWVtIHRvIGNvbXBs
YWluIGFib3V0IHRoaXMKaW50IC0+IHZvaWQgKiBjYXN0ICh0aGVyZSdzIHByb2JhYmx5IHNvbWUg
a2luZCBvZiBhdXRvLXByb21vdGlvbiB0bwpwb2ludGVyIHNpemUpLCBidXQgaXQgZG9lcyBjb21w
bGFpbnMgYWJvdXQgdGhlIGZvbGxvd2luZyB2b2lkICogLT4gaW50CmNhc3Q6Cgpkcml2ZXJzL2lp
by9pbXUvc3RfbHNtNmRzeC9zdF9sc202ZHN4X2kzYy5jOiBJbiBmdW5jdGlvbiDigJhzdF9sc202
ZHN4X2kzY19wcm9iZeKAmToKZHJpdmVycy9paW8vaW11L3N0X2xzbTZkc3gvc3RfbHNtNmRzeF9p
M2MuYzo0Mzo0Mzogd2FybmluZzogY2FzdCBmcm9tIHBvaW50ZXIgdG8gaW50ZWdlciBvZiBkaWZm
ZXJlbnQgc2l6ZSBbLVdwb2ludGVyLXRvLWludC1jYXN0XQogICA0MyB8ICByZXR1cm4gc3RfbHNt
NmRzeF9wcm9iZSgmaTNjZGV2LT5kZXYsIDAsIChpbnQpaWQtPmRhdGEsIHJlZ21hcCk7CiAgICAg
IHwgICAgIAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
bGludXgtaTNjIG1haWxpbmcgbGlzdApsaW51eC1pM2NAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRw
Oi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWkzYwo=
