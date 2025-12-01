Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 889B5D116F1
	for <linux-i3c@archiver.kernel.org>; Mon,  1 Dec 2025 17:17:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dpAkuawzzka2AqNG25kpTS5IflM1NpSezya26cPfKsM=; b=OKNnquyHh3vs8q
	qKb7n8QtZjTQ7feDWUd48YAxOfD58QyxvwSpOUdf6fkulLM6d+4PQUqmWLIL3umPO/WzYrxwJkaKr
	sTabtuuFVM1oCDro9UtwLwhEIvZfq3kX8otvsSBsk9edBnKlbouBRQBncA1ufkubn5g7mIRPHGVcc
	L3zLDrHhgozZEMVaH8yelKgH39NsZb+YRYY/2newUYcwiDE6PTvJYoP+xUEU7siOYorzAzlOZXs7Z
	n6dM6kZ/GaugISlooGUbbsBDuMpiaBzUJJdqKXFT5auSjhzUg+4DEdOw2WZ4v2T7fbYAbtlzvi+Jc
	Ww5hE7nWMBL3Q9C8nxMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQ7Wg-00000004Lvh-1El2;
	Mon, 01 Dec 2025 17:17:26 +0000
Received: from mail-northeuropeazlp170110003.outbound.protection.outlook.com ([2a01:111:f403:c200::3] helo=DU2PR03CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQ7We-00000004LvA-29RT
	for linux-i3c@lists.infradead.org;
	Mon, 01 Dec 2025 17:17:25 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZifwOxn1aAup82BLZnx8FBZL4n7pX5+Vgqwrf+eXD0EA3kS90u0wzwiBlHSPM6fHmbLbamhTjHy7YFuOuHK0nAXU/tkPg8r5SpNwS2ZCc1EAOEu+ciEzomQ+IQTW8a9JeQtjhpC0HGF3eANfEHiZG0k9Ue7S2RZ8MB6HhYMfbdt3ePgzJo1tvTecTcYkwDZYrwa84qymrYePh4bqjXPR/LsyMYpYlQt9eFez49gHH0isL+zfZevKHFqA0/a0rlbOnvIeCLwlIjDV/w2aBqETxtyJeZ7Cmz8MNboVGk5doAsStuNBzqH0Ha9e9AAu1drySPmIM7lFBNSPv0UyCWKOrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9jNtgh2/F8ayulicJ2BW84jh2FpF2hHtfHiH9mJRqHg=;
 b=RS30A64Xxe61pBOGE1Xx4Zxu9f+uCFo51PIQQclCaOELYwTVT/iJPeDKMOkjbZUt5jb29dDcGhoCM97IA2Xt6t57ZPbYaCCEoqWQ1FChLGeDxW3WA3fDYEK56JgKmWmNgA5XGGpVcRaIsbc+qHVNxC9mBXiIt/D2nP/3LdI5YFfxMzrUSKVwzj2VuwHD6/2zYpn0a+guT+GNymIfWmwLtlJX/oPmNvXu1o1qG/kcKQsiiuB4XCn6k+uuDn0NE+xOQCvzYUF4ESoqymmxeEaKN3Rvd2tsjf9axG+Zq5AF83bM8/A/1TC9zFPGasbvp1iEh88Lh56cfE/UucCiB6VTQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9jNtgh2/F8ayulicJ2BW84jh2FpF2hHtfHiH9mJRqHg=;
 b=iE+6zrTM8AovucTd0IGNWYUmNJN9+5ht8KxVYKBz/s0yzDyQzX8vlIBipRnfZiKvJKx3exsrpFZD4AC3+/06umXAWowWFJozVpuObBxKkZOsM7OlP+2Cp9VKcg8wimD91sBC8eBZydidIEpO+tL2IFMEIf232M2OMfXl++iqhd7iUgbCopQ+XHtEeOhW+UtfCP7ifCxNESLWxYyAqZxAbbV74CGoeFgEHSNBbuzfZVP1y7HJ2G4zGtb6D9occX8znDAg/L10ydg4ohRJTGYtwGD5aX0/CjK8jZo+drLvfaRhd8cZ0s9njvuO1R105+HjasTCFn4CwyFyV9exetGb6A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8951.eurprd04.prod.outlook.com (2603:10a6:10:2e2::22)
 by AS8PR04MB8851.eurprd04.prod.outlook.com (2603:10a6:20b:42e::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.17; Mon, 1 Dec
 2025 17:17:14 +0000
Received: from DU2PR04MB8951.eurprd04.prod.outlook.com
 ([fe80::753c:468d:266:196]) by DU2PR04MB8951.eurprd04.prod.outlook.com
 ([fe80::753c:468d:266:196%4]) with mapi id 15.20.9366.012; Mon, 1 Dec 2025
 17:17:14 +0000
Date: Mon, 1 Dec 2025 12:17:08 -0500
From: Frank Li <Frank.li@nxp.com>
To: adrianhoyin.ng@altera.com
Cc: alexandre.belloni@bootlin.com, linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 3/5] i3c: dw: Add sysfs support for Device NACK Retry
 count
Message-ID: <aS3NlA4H/SX8kW2Y@lizhi-Precision-Tower-5810>
References: <cover.1764571045.git.adrianhoyin.ng@altera.com>
 <42f1d2d980d45de27b0bb3bff85253464dc387ba.1764571045.git.adrianhoyin.ng@altera.com>
Content-Disposition: inline
In-Reply-To: <42f1d2d980d45de27b0bb3bff85253464dc387ba.1764571045.git.adrianhoyin.ng@altera.com>
X-ClientProxiedBy: PH7P222CA0010.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:510:33a::9) To DU2PR04MB8951.eurprd04.prod.outlook.com
 (2603:10a6:10:2e2::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8951:EE_|AS8PR04MB8851:EE_
X-MS-Office365-Filtering-Correlation-Id: 61a5f575-a5ca-4de5-d437-08de30fd7879
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|19092799006|52116014|376014|1800799024|38350700014|7053199007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?jbL7mOxUuJxu0Bh8La0zHuSbLlnBZQsZgMlcoImbDcW0vakQkZ4yNesQ2SOo?=
 =?us-ascii?Q?pitDuC56EWe/sIvCs4/SYbkl976XWKwNPtmgntucDIJbeQQOrNJLRhIzIlcK?=
 =?us-ascii?Q?1NmX1ic1F8kXoHciLIf4UCpOgzPcw9qZvtxfcQdAxfdYr3Wh7/2raoBvcZnd?=
 =?us-ascii?Q?QnoehLeUO5w0i8Uvr1m2Wp37ql06joPhCgBTHhWR+AK0XDIUuIbNyM9xbZtU?=
 =?us-ascii?Q?+F7mz0+G0TbsMiju9LrckqsOnO/5/rc7Y6Y8tRlNuktUjo6QqbcgctRy32un?=
 =?us-ascii?Q?Ku7CV0rCrbmKzeC/AcinYqPkIDxsMD1BZ/u7pQzBN/BBVLmkX48ZSRDSQxN6?=
 =?us-ascii?Q?im+XW87WGweBUPMMNRbtQhfsPOgzez7n1SvtfG+WLN9G8sZp6HMcRQhmKo+M?=
 =?us-ascii?Q?+LEFtDsXWWqBGUSVnAkN4GffvI87SozkAMrfPY4bttcF0OmvXpaEkpoK5ZY5?=
 =?us-ascii?Q?Hnb7YELwO6b1LgUaaNOsVQ3Xxj+N9ZcTgkVWoQutIKuEGI9YLBxisZXcNAXH?=
 =?us-ascii?Q?CAQ/JlOJa2SUzWF/yWV5JCfMx29fYQATtnaeSlGiuoe7RBpHhdPpne3Lp5o1?=
 =?us-ascii?Q?6dTvpmtCWSjxsZjH9mkfaF1vn1x//u071jTJg77a/GzsTEnxzaGN8Pkcerh1?=
 =?us-ascii?Q?JcTeQLywS/Dajhmj5uvK/Sgj77IgFSWiQPk7g00WwhFoxt/Tpgo65rHATuES?=
 =?us-ascii?Q?nVdgxUXrG5xjcp5BlZotmIkZkoPkm1sJkN0+pj32ChTI3o1no7Ot3yZ1FXUK?=
 =?us-ascii?Q?1VDwBVbGkb53F2xoZoPeRxZ7CzDUqZUKRY7DjWP4RQUYBpBmu1ifxzLftSic?=
 =?us-ascii?Q?LaQlEJUwcJWy40dmR/9Vttxy6aSE7qa+FtDiEFrftE9Vq/6Mon13QRHDo2UB?=
 =?us-ascii?Q?H8rkvkWak0yaXXdh1HMBScqsP8XDlkxIeX2Ek3uumOvZAs/F9Dp8YKOnUq/6?=
 =?us-ascii?Q?xku6bltIVfjyg58QRExME5EkqZ1F3s/K5s/1/IE63ag70XkM4Mob47WeLFj6?=
 =?us-ascii?Q?HSdk5au7zpPirO8COIiqOukHVd9miFEWuKrXr572h45RO+lVZsuqmCq06HwA?=
 =?us-ascii?Q?gVO6j+Yamk64Am9jE1JLvgj5vgotyt+6R0ij2o0LCaGeguRavcWEpdC6Q8uh?=
 =?us-ascii?Q?ev/1AkpSkaKoM1yxL2EfjtkptGOocaUWLiRYrYbvZ2EjfCkoCkGaLqVCOeJG?=
 =?us-ascii?Q?fNe9ChWyJKgPk03o+ibBbGsVdANjuD5wiVL68yfRepPqNnMs9zQpSG8Gah5W?=
 =?us-ascii?Q?dVXzwlQOm0I3QIEy9dbcoskx0qU0KgjjKA7ALAtLnIAFRegPAesCHG3Xv+4X?=
 =?us-ascii?Q?/Eyf09xrXHN96znyOHXEN57s3GpgufO9s+lnbvonDBlck1ExWtXwBmC919y0?=
 =?us-ascii?Q?CEv3d5AMIShWpZTZKyLWpqBLmYOztyXY0QIPqG8vs03jcp7lhPuLmkufSYox?=
 =?us-ascii?Q?zQQlPUi7e1lNBoiIKZoaIKtzm0Ag55JFGAGqX1t2edXBP40cEDrb5g=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8951.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(19092799006)(52116014)(376014)(1800799024)(38350700014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?VaamZI1osPYq5YZQYBLAlA1VbJDsO3niuOFHKeFTzGaVIkc29Syjk1/k9HKc?=
 =?us-ascii?Q?ZghWmOoWeOgJphqXKWR/DSlBHGM/+taFnKiTaWYTFSWiptInnv1FQFdpbbV7?=
 =?us-ascii?Q?683jEdrUz464Y2BSxfJul6rz3MOwOEz9SC7r7GWDlqkJLQaQLsKxeZEnaaZb?=
 =?us-ascii?Q?j/vv+Sf5oWlL4ZxqU6XJMaSG6K7p/m2XWBPgeG2kd2ksfgQHx0rjCnjxIJrR?=
 =?us-ascii?Q?y+M2I/d/i9aZWam1TYd1LHuwsNSHk1xOsYfWnThn95CwsbvDMjvdPasHdc1q?=
 =?us-ascii?Q?BRjmcKpX8QNsfXa0Aw5oDd5GnAPdyHZtFrpYCCS4I7eoh2mkCODGXQ1hTlgu?=
 =?us-ascii?Q?1oeb6VR++6UUbb2vczKte+LXPVUhB+MGdwN1Uc96BDANJvg8OFClW6g+mGMg?=
 =?us-ascii?Q?YCVv/LTceBG0ZKSMh5Rirs84Ss3W0GaooO8OZ4ND/MRzcWGM1r+Trc1ZNl4w?=
 =?us-ascii?Q?8i4SyDYzk/mgdORbleCHZEoC4wrjC2TBZowWafkHx/GoosLNSu6a5v0rcMw2?=
 =?us-ascii?Q?J/54gwUFbQ6xkg/gG1qBdAwWCZ9W0i34ocEbl/Vi/e7rzuYNrM/y2zkKDhjl?=
 =?us-ascii?Q?wst2muXuH3PcTfoElBc9iwKZa4r23MfvYGrRlRuCtJ1qOSYz+aavOvnRKbDO?=
 =?us-ascii?Q?W5iXl8avVc7wZD9q635MvpRMh5VBVTE5wzE//SLCUIPVhMu4zI9twc8/kFZM?=
 =?us-ascii?Q?hFkmvKHMeVS+dkS++cQ6a4En2hOnQ59nuIXFFAIJaO5yad81PiNqP9cGRKTN?=
 =?us-ascii?Q?ybQ0/i2MzFflZw2IZuJo0UuRu23ZAtgriE0JA68yMzFR4C/X+/hN1xqDr05w?=
 =?us-ascii?Q?EChtifkoHf5CGFbWODa9vThLO+uw5bKq07Zm8UiXP06IWHjDloAQWAD8ABFQ?=
 =?us-ascii?Q?O8aHQ6+WJn9YzJ2KkUm1j3GzMy1/w7kgvWfU4h3lQxf0P3OAcE7MFYRSH+4r?=
 =?us-ascii?Q?nSNzK8h/rKMi5sjceCH/k6/77CGqrLxof0GxmnzGtzLBi/dbIR7ixDjSW3Hw?=
 =?us-ascii?Q?UYjO1rbg9Y4BOvUJ5v5Y30Epr93YtEYBJGVzy4zyrlbGZBoQAh8lvUhceAf2?=
 =?us-ascii?Q?qcHEXa0dqC45053VzZTDsHJXZL8Zw8iW6cBao15g2mePRfn0HC4nPEa42qov?=
 =?us-ascii?Q?LG071aEbenDndmiIiY8XZ9Fk41K2iiTAmU0LCOmmUIuESnnZ/Rre/MdsHITL?=
 =?us-ascii?Q?GvJtUBdk9XkVROVxTu62u3Vu87yYQQN1epLk5HDmpfzBupqLhNjRxg6K1cCY?=
 =?us-ascii?Q?mFT8TrBvWYKo3LNjT1u53YAn67MATXxI2gJjU4Ihv8zqsE24KIC0fYtItvfm?=
 =?us-ascii?Q?VekMYhOE0+8xTpinIR7weOPxUNZiW0jj11ITHdgvTpOAHr0zHAr3GHQfZ4Mp?=
 =?us-ascii?Q?V0QahnT1JusiENBzfETjiFUqw8NPX5Adb6LFfdAdt75MIibcFJudcDk+E9w2?=
 =?us-ascii?Q?UgZ7KNzdppiWa2N5vcyZTuvgNc/BLULhyaNYUJWo4JG4u9OvruzDCXfOzwvo?=
 =?us-ascii?Q?aZedQq/IAKuNraR+g8Lb9nNsd3XBEheamOi6D5dBN/xzsZv5xFT9SI0/kGA9?=
 =?us-ascii?Q?SUDsDVL498b96LeAreGJAXePFWxU/WefNtXioQ0Z?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 61a5f575-a5ca-4de5-d437-08de30fd7879
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8951.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Dec 2025 17:17:14.0763
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: elox7Ns4WFFkhIV5m5Rq89K8HrZ2ZZ7ehc4gcfzKHOa9W/5crBhTEi/GPbzWdF77JqtoOOfOn/yxREhDSMwcqA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8851
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251201_091724_579043_65994057 
X-CRM114-Status: GOOD (  25.29  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org

On Mon, Dec 01, 2025 at 02:41:56PM +0800, adrianhoyin.ng@altera.com wrote:
> From: Adrian Ng Ho Yin <adrianhoyin.ng@altera.com>
>
> The DesignWare I3C controller supports automatically retrying transactions
> when a device NACKs. This is useful for slave devices that may be
> temporarily busy and not ready to respond immediately.
>
> Adds a controller-wide sysfs attribute, dev_nack_retry_count, to read or
> adjust the retry count at runtime. Returns error when value exceeds hw
> specified limit, and the updated value is programmed into all active DAT
> entries.
>
> Signed-off-by: Adrian Ng Ho Yin <adrianhoyin.ng@altera.com>
> ---
>  drivers/i3c/master/dw-i3c-master.c | 69 ++++++++++++++++++++++++++++++
>  drivers/i3c/master/dw-i3c-master.h |  1 +
>  2 files changed, 70 insertions(+)
>
> diff --git a/drivers/i3c/master/dw-i3c-master.c b/drivers/i3c/master/dw-i3c-master.c
> index 9ceedf09c3b6..a34b4f05dbd3 100644
> --- a/drivers/i3c/master/dw-i3c-master.c
> +++ b/drivers/i3c/master/dw-i3c-master.c
> @@ -204,8 +204,10 @@
>  #define EXTENDED_CAPABILITY		0xe8
>  #define SLAVE_CONFIG			0xec
>
> +#define DW_I3C_DEV_NACK_RETRY_CNT_MAX	0x3
>  #define DEV_ADDR_TABLE_IBI_MDB		BIT(12)
>  #define DEV_ADDR_TABLE_SIR_REJECT	BIT(13)
> +#define DEV_ADDR_TABLE_DEV_NACK_RETRY_CNT(x)	(((x) << 29) & GENMASK(30, 29))
>  #define DEV_ADDR_TABLE_LEGACY_I2C_DEV	BIT(31)
>  #define DEV_ADDR_TABLE_DYNAMIC_ADDR(x)	(((x) << 16) & GENMASK(23, 16))
>  #define DEV_ADDR_TABLE_STATIC_ADDR(x)	((x) & GENMASK(6, 0))
> @@ -295,6 +297,64 @@ to_dw_i3c_master(struct i3c_master_controller *master)
>  	return container_of(master, struct dw_i3c_master, base);
>  }
>
> +static ssize_t dw_dev_nack_retry_count_show(struct device *dev,
> +					    struct device_attribute *attr,
> +					    char *buf)
> +{
> +	struct dw_i3c_master *master = dev_get_drvdata(dev);
> +
> +	return sysfs_emit(buf, "%u\n", master->dev_nack_retry_cnt);
> +}
> +
> +static ssize_t dw_dev_nack_retry_count_store(struct device *dev,
> +					     struct device_attribute *attr,
> +					     const char *buf, size_t count)

https://lore.kernel.org/linux-i3c/cover.1763747151.git.adrianhoyin.ng@altera.com/T/#m825490f3f9d7e5332a128d604eed6aee62630ceb

Adrain hunter said MIPI I3C support nack_retry also. So moving it to
master.c should be good idea.

Frank

> +{
> +	struct dw_i3c_master *master = dev_get_drvdata(dev);
> +	unsigned long val;
> +	int ret, i;
> +	u32 reg;
> +
> +	ret = kstrtoul(buf, 0, &val);
> +	if (ret)
> +		return ret;
> +
> +	if (val > DW_I3C_DEV_NACK_RETRY_CNT_MAX) {
> +		dev_err(dev,
> +			"Value %lu exceeds maximum %d\n",
> +			val, DW_I3C_DEV_NACK_RETRY_CNT_MAX);
> +		return -ERANGE;
> +	}
> +
> +	master->dev_nack_retry_cnt = val;
> +
> +	i3c_bus_maintenance_lock(&master->base.bus);
> +	/*
> +	 * Update DAT entries for all currently attached devices.
> +	 * We directly iterate through the master's device array.
> +	 */
> +	for (i = 0; i < master->maxdevs; i++) {
> +		/* Skip free/empty slots */
> +		if (master->free_pos & BIT(i))
> +			continue;
> +
> +		reg = readl(master->regs +
> +				DEV_ADDR_TABLE_LOC(master->datstartaddr, i));
> +		reg &= ~GENMASK(30, 29);
> +		reg |= DEV_ADDR_TABLE_DEV_NACK_RETRY_CNT(val);
> +		writel(reg, master->regs +
> +			DEV_ADDR_TABLE_LOC(master->datstartaddr, i));
> +	}
> +	i3c_bus_maintenance_unlock(&master->base.bus);
> +
> +	return count;
> +}
> +
> +static struct device_attribute dev_attr_dev_nack_retry_count =
> +	__ATTR(dev_nack_retry_count, 0644,
> +	       dw_dev_nack_retry_count_show,
> +	       dw_dev_nack_retry_count_store);
> +
>  static void dw_i3c_master_disable(struct dw_i3c_master *master)
>  {
>  	writel(readl(master->regs + DEVICE_CTRL) & ~DEV_CTRL_ENABLE,
> @@ -1598,6 +1658,12 @@ int dw_i3c_common_probe(struct dw_i3c_master *master,
>  	if (ret)
>  		goto err_disable_pm;
>
> +	dev_set_drvdata(&master->base.dev, master);
> +	ret = device_create_file(&master->base.dev, &dev_attr_dev_nack_retry_count);
> +	if (ret)
> +		dev_warn(&master->base.dev,
> +			 "Failed to create dev_nack_retry_count sysfs: %d\n", ret);
> +
>  	return 0;
>
>  err_disable_pm:
> @@ -1617,6 +1683,9 @@ void dw_i3c_common_remove(struct dw_i3c_master *master)
>  	cancel_work_sync(&master->hj_work);
>  	i3c_master_unregister(&master->base);
>
> +	device_remove_file(&master->base.dev, &dev_attr_dev_nack_retry_count);
> +	dev_set_drvdata(&master->base.dev, NULL);
> +
>  	pm_runtime_disable(master->dev);
>  	pm_runtime_set_suspended(master->dev);
>  	pm_runtime_dont_use_autosuspend(master->dev);
> diff --git a/drivers/i3c/master/dw-i3c-master.h b/drivers/i3c/master/dw-i3c-master.h
> index c5cb695c16ab..45fc1774724a 100644
> --- a/drivers/i3c/master/dw-i3c-master.h
> +++ b/drivers/i3c/master/dw-i3c-master.h
> @@ -51,6 +51,7 @@ struct dw_i3c_master {
>  	u32 i2c_fm_timing;
>  	u32 i2c_fmp_timing;
>  	u32 quirks;
> +	u32 dev_nack_retry_cnt;
>  	/*
>  	 * Per-device hardware data, used to manage the device address table
>  	 * (DAT)
> --
> 2.49.GIT
>

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
