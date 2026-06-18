Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF551CD4F26
	for <linux-i3c@archiver.kernel.org>; Fri, 19 Jun 2026 13:50:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=m9lKqtjiZdou2wdHA35E30cV3z98jSGgbgDMUnYK2zg=; b=MRwURUmu/rb4srzidIZGhCb4fs
	8f9Dx1Jo2YHHlJ3t50WVIt9sx6fXG/dNyIXzPFY3JazeUFlJ+elLPUVFcEHb6LF4DMt6JI0UiNowa
	ZTPtVbvymPG6t0ZzRNXKfpAbz1PB9Qxit5a/jVkyahpvpLrCcFWP1iMtl1pBu7uNmVIByPwqdGcy0
	a7NmqwO2RP4/zu35YN/lhHrB7yKQop1FuM5WwLmNPoxsPeY2ThjyFEHSO1NbTM48K1G/q+P0kjBT9
	Pg5pcghcKxJJ93juWs1yJiCgmbLMSfrJDBuW7Ik4YmHo/QDDdmICwpaq7xCk5iG86msE4c+5eKAd4
	g50lS58A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1waZcF-00000002VS4-1lv0;
	Fri, 19 Jun 2026 13:50:39 +0000
Received: from ms.asus.com ([103.10.4.13])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wa9Yb-000000012Ol-2GFM
	for linux-i3c@lists.infradead.org;
	Thu, 18 Jun 2026 10:01:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=asmedia.com.tw; i=@asmedia.com.tw; q=dns/txt;
  s=asmediacomtw; t=1781776869; x=1813312869;
  h=from:to:cc:subject:date:message-id:mime-version;
  bh=rueJheQq209JP5hZCoKmB5izVuVtZlBsCn4wgGswypc=;
  b=eIpuSo/U1NyfGqBexxN3FgrdU6N16LjMB2KcDXT+TTA93AXEZ749neVI
   AdTLjDxrQ0pyMu3eNII5JxhFszYs7bNfBvmeF7qRNLypJHekZeBNLXWe+
   kabvCCZu3SWzk8ubcDztWMpVE+R0eKjgkVGA9LF8EqoPU3m7VTr9YH5GJ
   k=;
X-CSE-ConnectionGUID: ofk2siufQN+x9qtEMov2Xw==
X-CSE-MsgGUID: 2oDoDKp0RNmhA0JY/Es1Cg==
X-Attachment-filename: asmt-i3c-patch-series.tar.gz
Received: from unknown (HELO APZA004TMD.corpnet.asus) ([172.22.47.64])
  by ms.asus.com with ESMTP; 18 Jun 2026 18:01:07 +0800
Received: from APZA006TMD.corpnet.asus (172.22.47.66) by
 APZA004TMD.corpnet.asus (172.22.47.64) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Thu, 18 Jun 2026 18:01:05 +0800
Received: from APZA006TMD.corpnet.asus ([172.22.47.66]) by
 APZA006TMD.corpnet.asus ([172.22.47.66]) with mapi id 15.02.2562.043; Thu, 18
 Jun 2026 18:01:05 +0800
From: =?big5?B?Sm0gTGlhbyi5+avYu8op?= <Jm_Liao@asmedia.com.tw>
To: "alexandre.belloni@bootlin.com" <alexandre.belloni@bootlin.com>
CC: "Frank.Li@nxp.com" <Frank.Li@nxp.com>, "linux-i3c@lists.infradead.org"
	<linux-i3c@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, =?big5?B?WWQgVHNlbmcotL+4zrlGKQ==?=
	<Yd_Tseng@asmedia.com.tw>, =?big5?B?UGF0cmljayBZZW4owEa+y6fKKQ==?=
	<Patrick_Yen@asmedia.com.tw>
Subject: [PATCH 0/4] i3c: mipi-i3c-hci: Add support for ASMT I3C controller
Thread-Topic: [PATCH 0/4] i3c: mipi-i3c-hci: Add support for ASMT I3C
 controller
Thread-Index: Adz/CUSG5Xi6wWEaTgCEIqDS0qn65A==
Date: Thu, 18 Jun 2026 10:01:05 +0000
Message-ID: <f43667a6eff54729a06aed3c23877c01@asmedia.com.tw>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
x-originating-ip: [10.78.106.81]
x-tm-as-product-ver: SMEX-14.0.0.3239-9.1.2019-30014.005
x-tm-as-result: No-10-5.354000-8.000000
x-tmase-matchedrid: MnV6/QBRMnAfHU5fltg9RiRFbfQbCufdN0X64jGy2daSI3NjcezBrPhM
	8ljkvXlFBf+oLr2yQk2dug6njwt6TvKwzrVdvGUUITytpp/jrEyWzpGKWacixAzAN9dbyt8w6dB
	BVlGeOwG8QrKNZYIStzZbaZ2ComnJYJGpmiakxYwKRko19ZVs+mbsIPCQts6uUfzqVOlWyVJLUo
	Z1tpHJQgaG4Utj+sRE8CnZJ8TjGWAibGdC+CRqLb+76x+oFiflwHlWNQOXSgizmOsE8pU0i856p
	A6lDdM6qv9qsW8c7jQPA/JBJv8DUEu1EmGTE7iHegcjzi9WKeus8/KfphOTPTu5s8uupCWtuz1c
	wz1R0a8eMZbgtzP9KvJW7UTmrDh5iIDDIGRFPniJ+L9ZqIYNzA==
x-tm-as-user-approved-sender: No
x-tm-as-user-blocked-sender: No
x-tmase-result: 10-5.354000-8.000000
x-tmase-version: SMEX-14.0.0.3239-9.1.2019-30014.005
x-tm-snts-smtp: 703C67BFCE38FB54B0ECEDF8EED69956DBCCBA01B38436966C4848805D82955B2000:8
Content-Type: multipart/mixed;
	boundary="_002_f43667a6eff54729a06aed3c23877c01asmediacomtw_"
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260618_030109_869907_15139DB4 
X-CRM114-Status: UNSURE (   6.05  )
X-CRM114-Notice: Please train this message.
X-Mailman-Approved-At: Fri, 19 Jun 2026 06:50:37 -0700
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
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org

--_002_f43667a6eff54729a06aed3c23877c01asmediacomtw_
Content-Type: text/plain; charset="big5"
MIME-Version: 1.0
Content-Transfer-Encoding: base64

SGkgQWxleGFuZHJlLA0KDQpQbGVhc2UgZmluZCBhdHRhY2hlZCB0aGUgcGF0Y2ggc2VyaWVzIHRv
IGFkZCBzdXBwb3J0IGZvciB0aGUgQVNNVCBJM0MgY29udHJvbGxlci4NCg0KVGhpcyBzZXJpZXMg
YWRkcyBzdXBwb3J0IGZvciB0aGUgQVNNVCBJM0MgY29udHJvbGxlciwgaW5jbHVkaW5nIFBJTyBx
dWV1ZQ0KbWFuYWdlbWVudCBmb3IgSENJIHYxLjIgYW5kIG5lY2Vzc2FyeSBmaXhlcyBmb3IgSUJJ
IHByb2Nlc3NpbmcuDQoNClRoaXMgc2VyaWVzIGhhcyBiZWVuIHRlc3RlZCBvbiBvdXIgRlBHQSB2
YWxpZGF0aW9uIHBsYXRmb3JtLg0KDQpCZXN0IHJlZ2FyZHMsDQpKaWFuLU1pbmcgTGlhbw0KPT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09DQpU
aGlzIGVtYWlsIGFuZCBhbnkgYXR0YWNobWVudHMgdG8gaXQgY29udGFpbiBjb25maWRlbnRpYWwg
aW5mb3JtYXRpb24gYW5kIGFyZSBpbnRlbmRlZCBzb2xlbHkgZm9yIHRoZSB1c2Ugb2YgdGhlIGlu
ZGl2aWR1YWwgdG8gd2hvbSBpdCANCmlzIGFkZHJlc3NlZC5JZiB5b3UgYXJlIG5vdCB0aGUgaW50
ZW5kZWQgcmVjaXBpZW50IG9yIHJlY2VpdmUgaXQgYWNjaWRlbnRhbGx5LCBwbGVhc2UgaW1tZWRp
YXRlbHkgbm90aWZ5IHRoZSBzZW5kZXIgYnkgZS1tYWlsIGFuZCBkZWxldGUgDQp0aGUgbWVzc2Fn
ZSBhbmQgYW55IGF0dGFjaG1lbnRzIGZyb20geW91ciBjb21wdXRlciBzeXN0ZW0sIGFuZCBkZXN0
cm95IGFsbCBoYXJkIGNvcGllcy4gSWYgYW55LCBwbGVhc2UgYmUgYWR2aXNlZCB0aGF0IGFueSB1
bmF1dGhvcml6ZWQgDQpkaXNjbG9zdXJlLCBjb3B5aW5nLCBkaXN0cmlidXRpb24gb3IgYW55IGFj
dGlvbiB0YWtlbiBvciBvbWl0dGVkIGluIHJlbGlhbmNlIG9uIHRoaXMsIGlzIGlsbGVnYWwgYW5k
IHByb2hpYml0ZWQuIEZ1cnRoZXJtb3JlLCBhbnkgdmlld3MgDQpvciBvcGluaW9ucyBleHByZXNz
ZWQgYXJlIHNvbGVseSB0aG9zZSBvZiB0aGUgYXV0aG9yIGFuZCBkbyBub3QgcmVwcmVzZW50IHRo
b3NlIG9mIEFTTWVkaWEgVGVjaG5vbG9neSBJbmMuIFRoYW5rIHlvdSBmb3IgeW91ciBjb29wZXJh
dGlvbi4NCj09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PQo=

--_002_f43667a6eff54729a06aed3c23877c01asmediacomtw_
Content-Type: application/x-gzip; name="asmt-i3c-patch-series.tar.gz"
Content-Description: asmt-i3c-patch-series.tar.gz
Content-Disposition: attachment; filename="asmt-i3c-patch-series.tar.gz";
	size=5964; creation-date="Thu, 18 Jun 2026 10:00:54 GMT";
	modification-date="Thu, 18 Jun 2026 01:23:36 GMT"
Content-Transfer-Encoding: base64

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

--_002_f43667a6eff54729a06aed3c23877c01asmediacomtw_
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c

--_002_f43667a6eff54729a06aed3c23877c01asmediacomtw_--


