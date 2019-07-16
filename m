Return-Path: <SRS0=FANT=VN=lists.infradead.org=linux-i3c-bounces+linux-i3c=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 40DFEC76192
	for <linux-i3c@archiver.kernel.org>; Tue, 16 Jul 2019 13:40:27 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1620B2173C
	for <linux-i3c@archiver.kernel.org>; Tue, 16 Jul 2019 13:40:27 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="HKoWCgaU"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1620B2173C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rKS8oJ6+sEcEyohhAStz7iy806BitdmqKthQnPTjw3M=; b=HKoWCgaUaTWxrF
	yu3dXuWHC+i0+eXI/mWaKWKhKzbndGEGzHNf4Ci2JpaUY99ihatwfDYXcr5bMsSzTriHVZ3anOH09
	fDlTIZ0WZxnUgpsTzlWtZjnu2YkNr84d+H5GPEnajM4dB8NjP3ykZifpyvAZ70bHkGOWaUAfVRviJ
	xaYciLBJbEK6ypA3+Vjsnp55FXo2Nad4g9NYuHI/gbUaI9g7CflTjIA+waqfSjZ+Z8Kow+W38RrAS
	unEbdzsxsrIz7s4SYTHRUOID0BKlEk8t5NkBk5h23wuzh+CGwxQwDgR/yzdt467Srd7A6HzfIESrE
	NPG/GLnhiY/zWB8w3+hw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hnNgw-0006C9-Ms; Tue, 16 Jul 2019 13:40:26 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hnNgt-0006Az-2j
 for linux-i3c@lists.infradead.org; Tue, 16 Jul 2019 13:40:25 +0000
Received: from pc-375.home
 (2a01cb0c88d94a005820d607da339aae.ipv6.abo.wanadoo.fr
 [IPv6:2a01:cb0c:88d9:4a00:5820:d607:da33:9aae])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id D2944260C98;
 Tue, 16 Jul 2019 14:40:19 +0100 (BST)
Date: Tue, 16 Jul 2019 15:40:13 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Vitor Soares <Vitor.Soares@synopsys.com>
Subject: Re: [PATCH v4 3/3] iio: imu: st_lsm6dsx: add i3c basic support for
 LSM6DSO and LSM6DSR
Message-ID: <20190716154013.66fcaeb4@pc-375.home>
In-Reply-To: <SN6PR12MB2655E375BBEC555BFFBA1B05AECE0@SN6PR12MB2655.namprd12.prod.outlook.com>
References: <cover.1562931742.git.vitor.soares@synopsys.com>
 <f239834a6b8bd179094cdc19a3ac5ecaf807cee3.1562931742.git.vitor.soares@synopsys.com>
 <20190712181332.04f8b3da@linux.home>
 <SN6PR12MB26553046898233A094DCC952AEF20@SN6PR12MB2655.namprd12.prod.outlook.com>
 <20190712184323.28547c44@pc-381.home>
 <SN6PR12MB2655C68059719693C7EFF05CAEF20@SN6PR12MB2655.namprd12.prod.outlook.com>
 <20190712220320.50e7cfff@pc-381.home>
 <SN6PR12MB2655E375BBEC555BFFBA1B05AECE0@SN6PR12MB2655.namprd12.prod.outlook.com>
Organization: Collabora
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190716_064023_383062_4605F1FE 
X-CRM114-Status: GOOD (  31.75  )
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

T24gVHVlLCAxNiBKdWwgMjAxOSAxMzoyMjoyNSArMDAwMApWaXRvciBTb2FyZXMgPFZpdG9yLlNv
YXJlc0BzeW5vcHN5cy5jb20+IHdyb3RlOgoKPiBIaSBCb3JpcywKPiAKPiBGcm9tOiBCb3JpcyBC
cmV6aWxsb24gPGJvcmlzLmJyZXppbGxvbkBjb2xsYWJvcmEuY29tPgo+IERhdGU6IEZyaSwgSnVs
IDEyLCAyMDE5IGF0IDIxOjAzOjIwCj4gCj4gPiBPbiBGcmksIDEyIEp1bCAyMDE5IDE4OjQwOjE0
ICswMDAwCj4gPiBWaXRvciBTb2FyZXMgPFZpdG9yLlNvYXJlc0BzeW5vcHN5cy5jb20+IHdyb3Rl
Ogo+ID4gICAKPiA+ID4gRnJvbTogQm9yaXMgQnJlemlsbG9uIDxib3Jpcy5icmV6aWxsb25AY29s
bGFib3JhLmNvbT4KPiA+ID4gRGF0ZTogRnJpLCBKdWwgMTIsIDIwMTkgYXQgMTc6NDM6MjMKPiA+
ID4gICAKPiA+ID4gPiBPbiBGcmksIDEyIEp1bCAyMDE5IDE2OjI4OjAyICswMDAwCj4gPiA+ID4g
Vml0b3IgU29hcmVzIDxWaXRvci5Tb2FyZXNAc3lub3BzeXMuY29tPiB3cm90ZToKPiA+ID4gPiAg
ICAgCj4gPiA+ID4gPiBGcm9tOiBCb3JpcyBCcmV6aWxsb24gPGJvcmlzLmJyZXppbGxvbkBjb2xs
YWJvcmEuY29tPgo+ID4gPiA+ID4gRGF0ZTogRnJpLCBKdWwgMTIsIDIwMTkgYXQgMTc6MTQ6MjkK
PiA+ID4gPiA+ICAgICAKPiA+ID4gPiA+ID4gT24gRnJpLCAxMiBKdWwgMjAxOSAxMzo1MzozMCAr
MDIwMAo+ID4gPiA+ID4gPiBWaXRvciBTb2FyZXMgPFZpdG9yLlNvYXJlc0BzeW5vcHN5cy5jb20+
IHdyb3RlOgo+ID4gPiA+ID4gPiAgICAgICAKPiA+ID4gPiA+ID4gPiBGb3IgdG9kYXkgdGhlIHN0
X2xzbTZkc3ggZHJpdmVyIHN1cHBvcnQgTFNNNkRTTyBhbmQgTFNNNkRTUiBzZW5zb3Igb25seSBp
bgo+ID4gPiA+ID4gPiA+IHNwaSBhbmQgaTJjIG1vZGUuCj4gPiA+ID4gPiA+ID4gCj4gPiA+ID4g
PiA+ID4gVGhlIExTTTZEU08gYW5kIExTTTZEU1IgYXJlIGFsc28gaTNjIGNhcGFibGUgc28gbGV0
cyBnaXZlIGkzYyBzdXBwb3J0IHRvCj4gPiA+ID4gPiA+ID4gdGhlbS4KPiA+ID4gPiA+ID4gPiAK
PiA+ID4gPiA+ID4gPiBTaWduZWQtb2ZmLWJ5OiBWaXRvciBTb2FyZXMgPHZpdG9yLnNvYXJlc0Bz
eW5vcHN5cy5jb20+Cj4gPiA+ID4gPiA+ID4gQWNrZWQtYnk6IExvcmVuem8gQmlhbmNvbmkgPGxv
cmVuem9Aa2VybmVsLm9yZz4KPiA+ID4gPiA+ID4gPiAtLS0KPiA+ID4gPiA+ID4gPiBDaGFuZ2Vz
IGluIHY0Ogo+ID4gPiA+ID4gPiA+ICAgUmVtb3ZlIGh3X2lkIHZhcmlhYmxlCj4gPiA+ID4gPiA+
ID4gCj4gPiA+ID4gPiA+ID4gQ2hhbmdlcyBpbiB2MzoKPiA+ID4gPiA+ID4gPiAgIFJlbW92ZSB1
bm5lY2Vzc2FyeSBzdF9sc202ZHN4X2kzY19kYXRhIHRhYmxlIHVzZWQgdG8gaG9sZCBkZXZpY2Ug
bmFtZQo+ID4gPiA+ID4gPiA+ICAgVXNlIHN0X2xzbTZkc3hfcHJvYmUgbmV3IGZvcm0KPiA+ID4g
PiA+ID4gPiAKPiA+ID4gPiA+ID4gPiBDaGFuZ2VzIGluIHYyOgo+ID4gPiA+ID4gPiA+ICAgQWRk
IHN1cHBvcnQgZm9yIExTTTZEU1IKPiA+ID4gPiA+ID4gPiAgIFNldCBwbV9vcHMgdG8gc3RfbHNt
NmRzeF9wbV9vcHMKPiA+ID4gPiA+ID4gPiAKPiA+ID4gPiA+ID4gPiAgZHJpdmVycy9paW8vaW11
L3N0X2xzbTZkc3gvS2NvbmZpZyAgICAgICAgICB8ICA4ICsrKy0KPiA+ID4gPiA+ID4gPiAgZHJp
dmVycy9paW8vaW11L3N0X2xzbTZkc3gvTWFrZWZpbGUgICAgICAgICB8ICAxICsKPiA+ID4gPiA+
ID4gPiAgZHJpdmVycy9paW8vaW11L3N0X2xzbTZkc3gvc3RfbHNtNmRzeF9pM2MuYyB8IDU4ICsr
KysrKysrKysrKysrKysrKysrKysrKysrKysrCj4gPiA+ID4gPiA+ID4gIDMgZmlsZXMgY2hhbmdl
ZCwgNjYgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQo+ID4gPiA+ID4gPiA+ICBjcmVhdGUg
bW9kZSAxMDA2NDQgZHJpdmVycy9paW8vaW11L3N0X2xzbTZkc3gvc3RfbHNtNmRzeF9pM2MuYwo+
ID4gPiA+ID4gPiA+IAo+ID4gPiA+ID4gPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2lpby9pbXUv
c3RfbHNtNmRzeC9LY29uZmlnIGIvZHJpdmVycy9paW8vaW11L3N0X2xzbTZkc3gvS2NvbmZpZwo+
ID4gPiA+ID4gPiA+IGluZGV4IDllNTkyOTcuLjZiNWE3M2MgMTAwNjQ0Cj4gPiA+ID4gPiA+ID4g
LS0tIGEvZHJpdmVycy9paW8vaW11L3N0X2xzbTZkc3gvS2NvbmZpZwo+ID4gPiA+ID4gPiA+ICsr
KyBiL2RyaXZlcnMvaWlvL2ltdS9zdF9sc202ZHN4L0tjb25maWcKPiA+ID4gPiA+ID4gPiBAQCAt
MSwxMSArMSwxMiBAQAo+ID4gPiA+ID4gPiA+ICAKPiA+ID4gPiA+ID4gPiAgY29uZmlnIElJT19T
VF9MU002RFNYCj4gPiA+ID4gPiA+ID4gIAl0cmlzdGF0ZSAiU1RfTFNNNkRTeCBkcml2ZXIgZm9y
IFNUTSA2LWF4aXMgSU1VIE1FTVMgc2Vuc29ycyIKPiA+ID4gPiA+ID4gPiAtCWRlcGVuZHMgb24g
KEkyQyB8fCBTUEkpCj4gPiA+ID4gPiA+ID4gKwlkZXBlbmRzIG9uIChJMkMgfHwgU1BJIHx8IEkz
QykKPiA+ID4gPiA+ID4gPiAgCXNlbGVjdCBJSU9fQlVGRkVSCj4gPiA+ID4gPiA+ID4gIAlzZWxl
Y3QgSUlPX0tGSUZPX0JVRgo+ID4gPiA+ID4gPiA+ICAJc2VsZWN0IElJT19TVF9MU002RFNYX0ky
QyBpZiAoSTJDKQo+ID4gPiA+ID4gPiA+ICAJc2VsZWN0IElJT19TVF9MU002RFNYX1NQSSBpZiAo
U1BJX01BU1RFUikKPiA+ID4gPiA+ID4gPiArCXNlbGVjdCBJSU9fU1RfTFNNNkRTWF9JM0MgaWYg
KEkzQykKPiA+ID4gPiA+ID4gPiAgCWhlbHAKPiA+ID4gPiA+ID4gPiAgCSAgU2F5IHllcyBoZXJl
IHRvIGJ1aWxkIHN1cHBvcnQgZm9yIFNUTWljcm9lbGVjdHJvbmljcyBMU002RFN4IGltdQo+ID4g
PiA+ID4gPiA+ICAJICBzZW5zb3IuIFN1cHBvcnRlZCBkZXZpY2VzOiBsc202ZHMzLCBsc202ZHMz
aCwgbHNtNmRzbCwgbHNtNmRzbSwKPiA+ID4gPiA+ID4gPiBAQCAtMjMsMyArMjQsOCBAQCBjb25m
aWcgSUlPX1NUX0xTTTZEU1hfU1BJCj4gPiA+ID4gPiA+ID4gIAl0cmlzdGF0ZQo+ID4gPiA+ID4g
PiA+ICAJZGVwZW5kcyBvbiBJSU9fU1RfTFNNNkRTWAo+ID4gPiA+ID4gPiA+ICAJc2VsZWN0IFJF
R01BUF9TUEkKPiA+ID4gPiA+ID4gPiArCj4gPiA+ID4gPiA+ID4gK2NvbmZpZyBJSU9fU1RfTFNN
NkRTWF9JM0MKPiA+ID4gPiA+ID4gPiArCXRyaXN0YXRlCj4gPiA+ID4gPiA+ID4gKwlkZXBlbmRz
IG9uIElJT19TVF9MU002RFNYCj4gPiA+ID4gPiA+ID4gKwlzZWxlY3QgUkVHTUFQX0kzQwo+ID4g
PiA+ID4gPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2lpby9pbXUvc3RfbHNtNmRzeC9NYWtlZmls
ZSBiL2RyaXZlcnMvaWlvL2ltdS9zdF9sc202ZHN4L01ha2VmaWxlCj4gPiA+ID4gPiA+ID4gaW5k
ZXggZTVmNzMzYy4uYzY3Njk2NSAxMDA2NDQKPiA+ID4gPiA+ID4gPiAtLS0gYS9kcml2ZXJzL2lp
by9pbXUvc3RfbHNtNmRzeC9NYWtlZmlsZQo+ID4gPiA+ID4gPiA+ICsrKyBiL2RyaXZlcnMvaWlv
L2ltdS9zdF9sc202ZHN4L01ha2VmaWxlCj4gPiA+ID4gPiA+ID4gQEAgLTQsMyArNCw0IEBAIHN0
X2xzbTZkc3gteSA6PSBzdF9sc202ZHN4X2NvcmUubyBzdF9sc202ZHN4X2J1ZmZlci5vIFwKPiA+
ID4gPiA+ID4gPiAgb2JqLSQoQ09ORklHX0lJT19TVF9MU002RFNYKSArPSBzdF9sc202ZHN4Lm8K
PiA+ID4gPiA+ID4gPiAgb2JqLSQoQ09ORklHX0lJT19TVF9MU002RFNYX0kyQykgKz0gc3RfbHNt
NmRzeF9pMmMubwo+ID4gPiA+ID4gPiA+ICBvYmotJChDT05GSUdfSUlPX1NUX0xTTTZEU1hfU1BJ
KSArPSBzdF9sc202ZHN4X3NwaS5vCj4gPiA+ID4gPiA+ID4gK29iai0kKENPTkZJR19JSU9fU1Rf
TFNNNkRTWF9JM0MpICs9IHN0X2xzbTZkc3hfaTNjLm8KPiA+ID4gPiA+ID4gPiBkaWZmIC0tZ2l0
IGEvZHJpdmVycy9paW8vaW11L3N0X2xzbTZkc3gvc3RfbHNtNmRzeF9pM2MuYyBiL2RyaXZlcnMv
aWlvL2ltdS9zdF9sc202ZHN4L3N0X2xzbTZkc3hfaTNjLmMKPiA+ID4gPiA+ID4gPiBuZXcgZmls
ZSBtb2RlIDEwMDY0NAo+ID4gPiA+ID4gPiA+IGluZGV4IDAwMDAwMDAuLjJlODk1MjQKPiA+ID4g
PiA+ID4gPiAtLS0gL2Rldi9udWxsCj4gPiA+ID4gPiA+ID4gKysrIGIvZHJpdmVycy9paW8vaW11
L3N0X2xzbTZkc3gvc3RfbHNtNmRzeF9pM2MuYwo+ID4gPiA+ID4gPiA+IEBAIC0wLDAgKzEsNTgg
QEAKPiA+ID4gPiA+ID4gPiArLy8gU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IEdQTC0yLjAKPiA+
ID4gPiA+ID4gPiArLyoKPiA+ID4gPiA+ID4gPiArICogQ29weXJpZ2h0IChjKSAyMDE4IFN5bm9w
c3lzLCBJbmMuIGFuZC9vciBpdHMgYWZmaWxpYXRlcy4KPiA+ID4gPiA+ID4gPiArICoKPiA+ID4g
PiA+ID4gPiArICogQXV0aG9yOiBWaXRvciBTb2FyZXMgPHZpdG9yLnNvYXJlc0BzeW5vcHN5cy5j
b20+Cj4gPiA+ID4gPiA+ID4gKyAqLwo+ID4gPiA+ID4gPiA+ICsKPiA+ID4gPiA+ID4gPiArI2lu
Y2x1ZGUgPGxpbnV4L2tlcm5lbC5oPgo+ID4gPiA+ID4gPiA+ICsjaW5jbHVkZSA8bGludXgvbW9k
dWxlLmg+Cj4gPiA+ID4gPiA+ID4gKyNpbmNsdWRlIDxsaW51eC9pM2MvZGV2aWNlLmg+Cj4gPiA+
ID4gPiA+ID4gKyNpbmNsdWRlIDxsaW51eC9pM2MvbWFzdGVyLmg+Cj4gPiA+ID4gPiA+ID4gKyNp
bmNsdWRlIDxsaW51eC9zbGFiLmg+Cj4gPiA+ID4gPiA+ID4gKyNpbmNsdWRlIDxsaW51eC9vZi5o
Pgo+ID4gPiA+ID4gPiA+ICsjaW5jbHVkZSA8bGludXgvcmVnbWFwLmg+Cj4gPiA+ID4gPiA+ID4g
Kwo+ID4gPiA+ID4gPiA+ICsjaW5jbHVkZSAic3RfbHNtNmRzeC5oIgo+ID4gPiA+ID4gPiA+ICsK
PiA+ID4gPiA+ID4gPiArc3RhdGljIGNvbnN0IHN0cnVjdCBpM2NfZGV2aWNlX2lkIHN0X2xzbTZk
c3hfaTNjX2lkc1tdID0gewo+ID4gPiA+ID4gPiA+ICsJSTNDX0RFVklDRSgweDAxMDQsIDB4MDA2
QywgKHZvaWQgKilTVF9MU002RFNPX0lEKSwKPiA+ID4gPiA+ID4gPiArCUkzQ19ERVZJQ0UoMHgw
MTA0LCAweDAwNkIsICh2b2lkICopU1RfTFNNNkRTUl9JRCksICAgICAgCj4gPiA+ID4gPiA+IAo+
ID4gPiA+ID4gPiBJIHRoaW5rIHlvdSBuZWVkIGFuIHVpbnRwdHJfdCBjYXN0IGhlcmU6Cj4gPiA+
ID4gPiA+IAo+ID4gPiA+ID4gPiAJSTNDX0RFVklDRSgweDAxMDQsIDB4MDA2QywgKHZvaWQgKiko
dWludHB0cl90KVNUX0xTTTZEU09fSUQpLAo+ID4gPiA+ID4gPiAJSTNDX0RFVklDRSgweDAxMDQs
IDB4MDA2QiwgKHZvaWQgKikodWludHB0cl90KVNUX0xTTTZEU1JfSUQpLAo+ID4gPiA+ID4gPiAK
PiA+ID4gPiA+ID4gb3RoZXJ3aXNlIGdjYyBtaWdodCBjb21wbGFpbiB0aGF0IHRoZSBpbnRlZ2Vy
IGFuZCBwb2ludGVyIGRvIG5vdCBoYXZlCj4gPiA+ID4gPiA+IHRoZSBzYW1lIHNpemUgKG9uIDY0
LWJpdCBhcmNoaXRlY3R1cmVzKS4gICAgICAKPiA+ID4gPiA+IAo+ID4gPiA+ID4gSSBkb24ndCB1
bmRlcnN0YW5kIHRoaXMgcGFydC4gQ2FuIHlvdSBwcm92aWRlIG9yIHBvaW50IHNvbWUgYmFja2dy
b3VuZD8gICAgCj4gPiA+ID4gCj4gPiA+ID4gSWYgeW91IGRvbid0IGRvIHRoYXQgeW91J2xsIGdl
dCB0aGUgZm9sbG93aW5nIHdhcm5pbmc6Cj4gPiA+ID4gCj4gPiA+ID4gCXdhcm5pbmc6IGNhc3Qg
dG8gJ3ZvaWQgKicgZnJvbSBzbWFsbGVyIGludGVnZXIgdHlwZSAnaW50JyBbLVdpbnQtdG8tdm9p
ZC1wb2ludGVyLWNhc3RdICAgIAo+ID4gPiAKPiA+ID4gSSBkb24ndCBnZXQgdGhlIHdhcm5pbmcg
ZHVyaW5nIGNvbXBpbGF0aW9uLiBJcyB0aGVyZSBhbnkgZmxhZyB0byBlbmFibGUgCj4gPiA+IG9y
IHNvPyAgCj4gPiAKPiA+IE5vcGUsIG5vdGhpbmcgc3BlY2lmaWMgdG8gZW5hYmxlLCBqdXN0IGVu
YWJsZSB0aGlzIGRyaXZlciBvbiBhbiBhcm02NAo+ID4gY29uZmlnLiBOb3RlIHRoYXQgdGhhdCBn
Y2MgZG9lc24ndCBzZWVtIHRvIGNvbXBsYWluIGFib3V0IHRoaXMKPiA+IGludCAtPiB2b2lkICog
Y2FzdCAodGhlcmUncyBwcm9iYWJseSBzb21lIGtpbmQgb2YgYXV0by1wcm9tb3Rpb24gdG8KPiA+
IHBvaW50ZXIgc2l6ZSksIGJ1dCBpdCBkb2VzIGNvbXBsYWlucyBhYm91dCB0aGUgZm9sbG93aW5n
IHZvaWQgKiAtPiBpbnQKPiA+IGNhc3Q6Cj4gPiAKPiA+IGRyaXZlcnMvaWlvL2ltdS9zdF9sc202
ZHN4L3N0X2xzbTZkc3hfaTNjLmM6IEluIGZ1bmN0aW9uIOKAmHN0X2xzbTZkc3hfaTNjX3Byb2Jl
4oCZOgo+ID4gZHJpdmVycy9paW8vaW11L3N0X2xzbTZkc3gvc3RfbHNtNmRzeF9pM2MuYzo0Mzo0
Mzogd2FybmluZzogY2FzdCBmcm9tIHBvaW50ZXIgdG8gaW50ZWdlciBvZiBkaWZmZXJlbnQgc2l6
ZSBbLVdwb2ludGVyLXRvLWludC1jYXN0XQo+ID4gICAgNDMgfCAgcmV0dXJuIHN0X2xzbTZkc3hf
cHJvYmUoJmkzY2Rldi0+ZGV2LCAwLCAoaW50KWlkLT5kYXRhLCByZWdtYXApOwo+ID4gICAgICAg
fCAgICAgICAKPiAKPiBJIGZpeGVkIHRoZSB3YXJuaW5nIGJ5IGNoYW5naW5nOgo+IAo+IHN0X2xz
bTZkc3hfcHJvYmUoJmkzY2Rldi0+ZGV2LCAwLCAoaW50KWlkLT5kYXRhLCByZWdtYXApOwo+IAo+
IHRvCj4gCj4gc3RfbHNtNmRzeF9wcm9iZSgmaTNjZGV2LT5kZXYsIDAsIChpbnQpKHVpbnRwdHJf
dClpZC0+ZGF0YSwgcmVnbWFwKTsKClRoZSAoaW50KSBjYXN0IGlzIGltcGxpY2l0LCBubyBuZWVk
IHRvIGFkZCBpdCBoZXJlLgoKPiAKPiBCdXQgSSB3b25kZXIgaWYgaXQgaXNuJ3QgbW9yZSBzYXZl
IHRvIGNoYW5nZSB0aGUgZm9sbG93aW5nIHRvbzoKPiAJSTNDX0RFVklDRSgweDAxMDQsIDB4MDA2
QywgKHZvaWQgKikodWludHB0cl90KVNUX0xTTTZEU09fSUQpLAo+IAlJM0NfREVWSUNFKDB4MDEw
NCwgMHgwMDZCLCAodm9pZCAqKSh1aW50cHRyX3QpU1RfTFNNNkRTUl9JRCksCj4gCj4gV2hhdCBk
byB5b3UgdGhpbms/CgpJIHRoaW5rIHdlJ3JlIGdvb2QsIHdlIHdvdWxkIGhhdmUgYSBwcm9ibGVt
IGlmIHlvdSB3ZXJlIGRlZmluaW5nClNUX0xTTTZEU09fSUQgYXMgYW4gVUxMICh1bnNpZ25lZCBs
b25nIGxvbmcsIEFLQSB1NjQpIGFuZCB0cnlpbmcgdG8KY2FzdCB0aGF0IHZhbHVlIHRvIGEgdm9p
ZCBwb2ludGVyIG9uIGEgMzItYml0IGFyY2guCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpsaW51eC1pM2MgbWFpbGluZyBsaXN0CmxpbnV4LWkzY0BsaXN0
cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGlu
Zm8vbGludXgtaTNjCg==
