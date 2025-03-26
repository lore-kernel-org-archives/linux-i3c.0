Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43AD6C36016
	for <linux-i3c@archiver.kernel.org>; Mon, 31 Mar 2025 10:04:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=vV6wIIaxziLktAOX0YpP7tjHphKb7Rs/CKtUTbucf4g=; b=MzYabd6+5ngivA
	rZEAmzfGDGM1aVWmCB6G1nhjObOodHVIKIopVOUQVG2o3maHjjcn4cHoKdGAfdjYoX7rGGoWI7W4Z
	/YkrGduJlWcqnI5Pj/4iDPQO5X8inMRVNcBx83V0A1VDssOab7gKtLOgp8Z00E/nUxM8caISXB0Nu
	N8SvD1ekz7XSMbrsGieZecW24Sc1wh21qoyAnA9ZZ7XDXp9iUg7l3Gd5vKo2IkARkJKRt316L3ctk
	7eZrEyrnBbssjgg6zXTDpppHW51qK9wxUepUqR3NCNNYVbnfjGOley8rVYP7TMCP3iBly3ft5Qmdh
	77k6We1l25tadd5veHeA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzC0E-0000000Hb2V-086U;
	Mon, 31 Mar 2025 10:04:22 +0000
Received: from inva021.nxp.com ([92.121.34.21])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txPuN-00000008SZt-3yci
	for linux-i3c@lists.infradead.org;
	Wed, 26 Mar 2025 12:31:01 +0000
Received: from inva021.nxp.com (localhost [127.0.0.1])
	by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 613AF2022B6;
	Wed, 26 Mar 2025 13:30:56 +0100 (CET)
Received: from aprdc01srsp001v.ap-rdc01.nxp.com (aprdc01srsp001v.ap-rdc01.nxp.com [165.114.16.16])
	by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 21774202163;
	Wed, 26 Mar 2025 13:30:56 +0100 (CET)
Received: from lsv03121.swis.in-blr01.nxp.com (lsv03121.swis.in-blr01.nxp.com [92.120.146.118])
	by aprdc01srsp001v.ap-rdc01.nxp.com (Postfix) with ESMTP id C472B1800092;
	Wed, 26 Mar 2025 20:30:54 +0800 (+08)
From: Manjunatha Venkatesh <manjunatha.venkatesh@nxp.com>
To: alexandre.belloni@bootlin.com,
	arnd@arndb.de,
	gregkh@linuxfoundation.org,
	bbrezillon@kernel.org,
	linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	frank.li@nxp.com
Cc: rvmanjumce@gmail.com,
	Manjunatha Venkatesh <manjunatha.venkatesh@nxp.com>,
	stable@vger.kernel.org
Subject: [PATCH v6] i3c: Add NULL pointer check in i3c_master_queue_ibi()
Date: Wed, 26 Mar 2025 18:00:46 +0530
Message-ID: <20250326123047.2797946-1-manjunatha.venkatesh@nxp.com>
X-Mailer: git-send-email 2.46.1
MIME-Version: 1.0
X-Virus-Scanned: ClamAV using ClamSMTP
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250326_053100_117114_13871AAA 
X-CRM114-Status: UNSURE (   9.79  )
X-CRM114-Notice: Please train this message.
X-Mailman-Approved-At: Mon, 31 Mar 2025 02:45:26 -0700
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

VGhlIEkzQyBtYXN0ZXIgZHJpdmVyIG1heSByZWNlaXZlIGFuIElCSSBmcm9tIGEgdGFyZ2V0IGRl
dmljZSB0aGF0IGhhcyBub3QKYmVlbiBwcm9iZWQgeWV0LiBJbiBzdWNoIGNhc2VzLCB0aGUgbWFz
dGVyIGNhbGxzIGBpM2NfbWFzdGVyX3F1ZXVlX2liaSgpYAp0byBxdWV1ZSBhbiBJQkkgd29yayB0
YXNrLCBsZWFkaW5nIHRvICJVbmFibGUgdG8gaGFuZGxlIGtlcm5lbCByZWFkIGZyb20KdW5yZWFk
YWJsZSBtZW1vcnkiIGFuZCByZXN1bHRpbmcgaW4gYSBrZXJuZWwgcGFuaWMuCgpUeXBpY2FsIElC
SSBoYW5kbGluZyBmbG93OgoxLiBUaGUgSTNDIG1hc3RlciBzY2FucyB0YXJnZXQgZGV2aWNlcyBh
bmQgcHJvYmVzIHRoZWlyIHJlc3BlY3RpdmUgZHJpdmVycy4KMi4gVGhlIHRhcmdldCBkZXZpY2Ug
ZHJpdmVyIGNhbGxzIGBpM2NfZGV2aWNlX3JlcXVlc3RfaWJpKClgIHRvIGVuYWJsZSBJQkkKICAg
YW5kIGFzc2lnbnMgYGRldi0+aWJpID0gaWJpYC4KMy4gVGhlIEkzQyBtYXN0ZXIgcmVjZWl2ZXMg
YW4gSUJJIGZyb20gdGhlIHRhcmdldCBkZXZpY2UgYW5kIGNhbGxzCiAgIGBpM2NfbWFzdGVyX3F1
ZXVlX2liaSgpYCB0byBxdWV1ZSB0aGUgdGFyZ2V0IGRldmljZSBkcml2ZXLigJlzIElCSQogICBo
YW5kbGVyIHRhc2suCgpIb3dldmVyLCBzaW5jZSB0YXJnZXQgZGV2aWNlIGV2ZW50cyBhcmUgYXN5
bmNocm9ub3VzIHRvIHRoZSBJM0MgcHJvYmUKc2VxdWVuY2UsIHN0ZXAgMyBtYXkgb2NjdXIgYmVm
b3JlIHN0ZXAgMiwgY2F1c2luZyBgZGV2LT5pYmlgIHRvIGJlIGBOVUxMYCwKbGVhZGluZyB0byBh
IGtlcm5lbCBwYW5pYy4KCkFkZCBhIE5VTEwgcG9pbnRlciBjaGVjayBpbiBgaTNjX21hc3Rlcl9x
dWV1ZV9pYmkoKWAgdG8gcHJldmVudCBhY2Nlc3NpbmcKYW4gdW5pbml0aWFsaXplZCBgZGV2LT5p
YmlgLCBlbnN1cmluZyBzdGFiaWxpdHkuCgpGaXhlczogM2EzNzliYmNlYTBhZiAoImkzYzogQWRk
IGNvcmUgSTNDIGluZnJhc3RydWN0dXJlIikKQ2M6IHN0YWJsZUB2Z2VyLmtlcm5lbC5vcmcKTGlu
azogaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGttbC9aOWdqR1l1ZGlZeWwzYlNlQGxpemhpLVBy
ZWNpc2lvbi1Ub3dlci01ODEwLwpTaWduZWQtb2ZmLWJ5OiBNYW5qdW5hdGhhIFZlbmthdGVzaCA8
bWFuanVuYXRoYS52ZW5rYXRlc2hAbnhwLmNvbT4KLS0tCkNoYW5nZXMgc2luY2UgdjU6CiAgLSBV
cGRhdGVkIHN1YmplY3QgYW5kIGNvbW1pdCBtZXNzYWdlICB3aXRoIHNvbWUgbW9yZSBpbmZvcm1h
dGlvbi4KCiBkcml2ZXJzL2kzYy9tYXN0ZXIuYyB8IDMgKysrCiAxIGZpbGUgY2hhbmdlZCwgMyBp
bnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9pM2MvbWFzdGVyLmMgYi9kcml2ZXJz
L2kzYy9tYXN0ZXIuYwppbmRleCBkNWRjNDE4MGFmYmMuLmM2NTAwNmFhMDY4NCAxMDA2NDQKLS0t
IGEvZHJpdmVycy9pM2MvbWFzdGVyLmMKKysrIGIvZHJpdmVycy9pM2MvbWFzdGVyLmMKQEAgLTI1
NjEsNiArMjU2MSw5IEBAIHN0YXRpYyB2b2lkIGkzY19tYXN0ZXJfdW5yZWdpc3Rlcl9pM2NfZGV2
cyhzdHJ1Y3QgaTNjX21hc3Rlcl9jb250cm9sbGVyICptYXN0ZXIpCiAgKi8KIHZvaWQgaTNjX21h
c3Rlcl9xdWV1ZV9pYmkoc3RydWN0IGkzY19kZXZfZGVzYyAqZGV2LCBzdHJ1Y3QgaTNjX2liaV9z
bG90ICpzbG90KQogeworCWlmICghZGV2LT5pYmkgfHwgIXNsb3QpCisJCXJldHVybjsKKwogCWF0
b21pY19pbmMoJmRldi0+aWJpLT5wZW5kaW5nX2liaXMpOwogCXF1ZXVlX3dvcmsoZGV2LT5pYmkt
PndxLCAmc2xvdC0+d29yayk7CiB9Ci0tIAoyLjQ2LjEKCgotLSAKbGludXgtaTNjIG1haWxpbmcg
bGlzdApsaW51eC1pM2NAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFk
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWkzYwo=
